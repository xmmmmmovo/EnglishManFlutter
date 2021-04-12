package cn.fivezha.api.controller;

import cn.fivezha.api.core.response.Result;
import cn.fivezha.api.core.response.ResultGenerator;
import cn.fivezha.api.dto.ArticleDTO;
import cn.fivezha.api.dto.ArticleUploadDTO;
import cn.fivezha.api.entity.ArticleDO;
import cn.fivezha.api.service.ArticleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author xmmmmmovo
 * @date 2020/07/02
 */
@RestController
@RequestMapping("/article")
public class ArticleController {
    @Resource
    private ArticleService articleService;

    @PostMapping
    public Result add(@RequestBody ArticleDO articleDO) {
        articleService.save(articleDO);
        return ResultGenerator.genOkResult();
    }

    @PostMapping("/name")
    public Result addByName(@RequestBody ArticleUploadDTO articleUploadDTO) {
        articleService.uploadArticle(articleUploadDTO);
        return ResultGenerator.genOkResult();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        articleService.deleteById(id);
        return ResultGenerator.genOkResult();
    }

    @PatchMapping
    public Result update(@RequestBody ArticleDO articleDO) {
        articleService.update(articleDO);
        return ResultGenerator.genOkResult();
    }

    @GetMapping("/{id}")
    public Result detail(@PathVariable Long id) {
        ArticleDO articleDO = articleService.getById(id);
        return ResultGenerator.genOkResult(articleDO);
    }

    @GetMapping
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<ArticleDTO> list = articleService.listAllDTO();
        PageInfo<ArticleDTO> pageInfo = PageInfo.of(list);
        return ResultGenerator.genOkResult(pageInfo);
    }

    @GetMapping("/name")
    public Result listByName(
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "0") Integer size,
            @RequestParam(defaultValue = "") String userName
    ) {
        PageHelper.startPage(page, size);
        List<ArticleDTO> list = articleService.listAllDTOByName(userName);
        PageInfo<ArticleDTO> pageInfo = PageInfo.of(list);
        return ResultGenerator.genOkResult(pageInfo);
    }
}
