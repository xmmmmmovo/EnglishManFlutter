package cn.fivezha.api.controller;

import cn.fivezha.api.core.response.Result;
import cn.fivezha.api.core.response.ResultGenerator;
import cn.fivezha.api.dto.MyRemeberedWordDTO;
import cn.fivezha.api.dto.WordRemeberDTO;
import cn.fivezha.api.entity.RemeberedWordDO;
import cn.fivezha.api.service.RemeberedWordService;
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
@RequestMapping("/remebered/word")
public class RemeberedWordController {
    @Resource
    private RemeberedWordService remeberedWordService;

    @PostMapping
    public Result add(@RequestBody WordRemeberDTO wordRemeberDTO) {
        int index = remeberedWordService.add(wordRemeberDTO);
        return ResultGenerator.genOkResult(index);
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        remeberedWordService.deleteById(id);
        return ResultGenerator.genOkResult();
    }

    @PatchMapping
    public Result update(@RequestBody RemeberedWordDO remeberedWordDO) {
        remeberedWordService.update(remeberedWordDO);
        return ResultGenerator.genOkResult();
    }

    @GetMapping("/{id}")
    public Result detail(@PathVariable Long id) {
        RemeberedWordDO remeberedWordDO = remeberedWordService.getById(id);
        return ResultGenerator.genOkResult(remeberedWordDO);
    }

    @GetMapping
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<RemeberedWordDO> list = remeberedWordService.listAll();
        PageInfo<RemeberedWordDO> pageInfo = PageInfo.of(list);
        return ResultGenerator.genOkResult(pageInfo);
    }

    @GetMapping("/user")
    public Result listByUserName(@RequestParam(defaultValue = "0") Integer page,
                                 @RequestParam(defaultValue = "0") Integer size,
                                 @RequestParam(defaultValue = "") String userName) {
        List<MyRemeberedWordDTO> list = remeberedWordService.listByName(userName, size, page);
        PageInfo<MyRemeberedWordDTO> pageInfo = PageInfo.of(list);
        return ResultGenerator.genOkResult(pageInfo);
    }
}
