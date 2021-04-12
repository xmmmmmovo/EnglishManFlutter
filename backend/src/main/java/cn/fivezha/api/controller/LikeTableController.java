package cn.fivezha.api.controller;

import cn.fivezha.api.core.response.Result;
import cn.fivezha.api.core.response.ResultGenerator;
import cn.fivezha.api.dto.LikeStatusDTO;
import cn.fivezha.api.entity.LikeTableDO;
import cn.fivezha.api.service.LikeTableService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author xmmmmmovo
 * @date 2020/07/03
 */
@RestController
@RequestMapping("/like/table")
public class LikeTableController {
    @Resource
    private LikeTableService likeTableService;

    @PostMapping
    public Result add(@RequestBody LikeStatusDTO likeStatusDTO) {
        likeTableService.saveByName(likeStatusDTO);
        return ResultGenerator.genOkResult();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        likeTableService.deleteById(id);
        return ResultGenerator.genOkResult();
    }

    @PatchMapping
    public Result update(@RequestBody LikeTableDO likeTableDO) {
        likeTableService.update(likeTableDO);
        return ResultGenerator.genOkResult();
    }

    @GetMapping("/{id}")
    public Result detail(@PathVariable Long id) {
        LikeTableDO likeTableDO = likeTableService.getById(id);
        return ResultGenerator.genOkResult(likeTableDO);
    }

    @GetMapping
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<LikeTableDO> list = likeTableService.listAll();
        PageInfo<LikeTableDO> pageInfo = PageInfo.of(list);
        return ResultGenerator.genOkResult(pageInfo);
    }

    @GetMapping("/status")
    public Result statusUserLike(@RequestParam(defaultValue = "") String userName,
                                 @RequestParam(defaultValue = "0") Long id
    ) {
        Long res = likeTableService.fetchLikeStatus(userName, id);
        return ResultGenerator.genOkResult(res);
    }


}
