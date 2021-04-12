package cn.fivezha.api.service.impl;

import cn.fivezha.api.core.response.ResultCode;
import cn.fivezha.api.core.service.AbstractService;
import cn.fivezha.api.dto.RoleDTO;
import cn.fivezha.api.service.RoleService;
import cn.fivezha.api.entity.RoleDO;
import cn.fivezha.api.mapper.RoleMapper;
import cn.fivezha.api.util.AssertUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * @author Zoctan
 * @date 2018/05/27
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class RoleServiceImpl extends AbstractService<RoleDO> implements RoleService {
  @Resource private RoleMapper roleMapper;

  @Override
  public void saveAsDefaultRole(final Long accountId) {
    final boolean success = this.roleMapper.saveAsDefaultRole(accountId) == 1;
    AssertUtils.asserts(success, ResultCode.SAVE_FAILED, "账户默认角色保存失败");
  }

  @Override
  public void save(final RoleDTO roleDTO) {
    final RoleDO role = roleDTO.convertToDO();
    this.save(role);
  }

  @Override
  public void update(final RoleDTO roleDTO) {
    final RoleDO role = roleDTO.convertToDO();
    this.update(role);
  }
}
