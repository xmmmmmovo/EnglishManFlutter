package cn.fivezha.api.controller;

import cn.fivezha.api.core.response.Result;
import cn.fivezha.api.core.response.ResultGenerator;
import cn.fivezha.api.dto.UserLikesDTO;
import cn.fivezha.api.entity.UserLikesDO;
import cn.fivezha.api.service.UserLikesService;
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
@RequestMapping("/user/likes")
public class UserLikesController {
    @Resource
    private UserLikesService userLikesService;

    @PostMapping
    public Result add(@RequestBody UserLikesDTO userLikesDTO) {
        Long id = userLikesService.save(userLikesDTO);
        return ResultGenerator.genOkResult(id);
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        userLikesService.deleteById(id);
        return ResultGenerator.genOkResult();
    }

    @PatchMapping
    public Result update(@RequestBody UserLikesDO userLikesDO) {
        userLikesService.update(userLikesDO);
        return ResultGenerator.genOkResult();
    }

    @GetMapping("/{id}")
    public Result detail(@PathVariable Long id) {
        UserLikesDO userLikesDO = userLikesService.getById(id);
        return ResultGenerator.genOkResult(userLikesDO);
    }

    @GetMapping("/detail/{name}")
    public Result starDetail(@PathVariable String name) {
        List<UserLikesDO> userLikesDOList = userLikesService.starDetailList(name);
        return ResultGenerator.genOkResult(userLikesDOList);
    }

    @GetMapping
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<UserLikesDO> list = userLikesService.listAll();
        PageInfo<UserLikesDO> pageInfo = PageInfo.of(list);
        return ResultGenerator.genOkResult(pageInfo);
    }
}
