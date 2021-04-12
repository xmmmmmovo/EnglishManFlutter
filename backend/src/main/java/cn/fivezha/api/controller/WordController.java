package cn.fivezha.api.controller;

import cn.fivezha.api.core.cache.CacheExpire;
import cn.fivezha.api.core.response.Result;
import cn.fivezha.api.core.response.ResultGenerator;
import cn.fivezha.api.entity.WordDO;
import cn.fivezha.api.service.WordService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author xmmmmmovo
 * @date 2020/07/02
 */
@RestController
@RequestMapping("/word")
public class WordController {
    @Resource
    private WordService wordService;

    @PostMapping
    public Result add(@RequestBody WordDO wordDO) {
        wordService.save(wordDO);
        return ResultGenerator.genOkResult();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        wordService.deleteById(id);
        return ResultGenerator.genOkResult();
    }

    @PatchMapping
    public Result update(@RequestBody WordDO wordDO) {
        wordService.update(wordDO);
        return ResultGenerator.genOkResult();
    }

    @GetMapping("/{id}")
    public Result detail(@PathVariable Long id) {
        WordDO wordDO = wordService.getById(id);
        return ResultGenerator.genOkResult(wordDO);
    }

    @GetMapping
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<WordDO> list = wordService.listAll();
        PageInfo<WordDO> pageInfo = PageInfo.of(list);
        return ResultGenerator.genOkResult(pageInfo);
    }

    @GetMapping("/random")
    public Result random(
            @RequestParam(defaultValue = "20") Integer limit
    ) {
        return ResultGenerator.genOkResult(wordService.randomList(limit));
    }

    @GetMapping("/word")
    @Cacheable(value = "word.word", unless = "#result == null or #result.code != 200")
    @CacheExpire(expire = 60)
    public Result listByWord(
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "0") Integer size,
            @RequestParam(defaultValue = "") String word
    ) {
        PageHelper.startPage(page, size);
        List<WordDO> list = wordService.listByWord(word);
        PageInfo<WordDO> pageInfo = PageInfo.of(list);
        return ResultGenerator.genOkResult(pageInfo);
    }
}
