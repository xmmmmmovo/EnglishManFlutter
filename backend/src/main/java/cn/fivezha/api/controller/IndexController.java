package cn.fivezha.api.controller;

import cn.fivezha.api.core.response.Result;
import cn.fivezha.api.core.response.ResultGenerator;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@Api(value = "测试连接")
@Validated
@RestController
@RequestMapping("/ping")
public class IndexController {
    @ApiOperation(value = "获取时间戳", notes = "判断服务器是否能够访问")
    @GetMapping
    public Result index() {
        return ResultGenerator.genOkResult(System.currentTimeMillis());
    }
}
