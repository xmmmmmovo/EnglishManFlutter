package cn.fivezha.api.mapper;

import cn.fivezha.api.core.mapper.MyMapper;
import cn.fivezha.api.entity.RoleDO;
import org.apache.ibatis.annotations.Param;

/**
 * @author Zoctan
 * @date 2018/07/15
 */
public interface RoleMapper extends MyMapper<RoleDO> {
  /**
   * 赋予默认角色给账户
   *
   * @param accountId 账户Id
   * @return 影响行数
   */
  int saveAsDefaultRole(@Param("accountId") Long accountId);
}
