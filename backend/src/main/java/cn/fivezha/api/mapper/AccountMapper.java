package cn.fivezha.api.mapper;

import cn.fivezha.api.core.mapper.MyMapper;
import cn.fivezha.api.entity.AccountWithRoleDO;
import cn.fivezha.api.entity.AccountDO;
import cn.fivezha.api.query.AccountQuery;
import org.apache.ibatis.annotations.Param;

/**
 * @author Zoctan
 * @date 2018/05/27
 */
public interface AccountMapper extends MyMapper<AccountDO> {
  /**
   * 按条件查询账户
   *
   * @param accountQuery 账户查询条件
   * @return 账户
   */
  AccountWithRoleDO getByQueryWithRole(AccountQuery accountQuery);

  /**
   * 按账户名更新最后登陆时间
   *
   * @param name 账户名
   * @return 影响行数
   */
  int updateLoginTimeByName(@Param("name") String name);
}
