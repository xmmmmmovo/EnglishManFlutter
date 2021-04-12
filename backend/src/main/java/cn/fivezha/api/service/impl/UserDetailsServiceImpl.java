package cn.fivezha.api.service.impl;

import cn.fivezha.api.entity.AccountWithRoleDO;
import cn.fivezha.api.service.AccountService;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Zoctan
 * @date 2018/05/27
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UserDetailsServiceImpl implements UserDetailsService {
  @Resource private AccountService accountService;

  @Override
  public UserDetails loadUserByUsername(final String name) throws UsernameNotFoundException {
    final AccountWithRoleDO account = this.accountService.getByNameWithRole(name);
    if (account == null) {
      throw new UsernameNotFoundException("账户名不存在");
    }
    final List<SimpleGrantedAuthority> authorities = new ArrayList<>();
    account
        .getRoles()
        .forEach(roleDO -> authorities.add(new SimpleGrantedAuthority(roleDO.getName())));
    return new User(
        account.getName(), account.getPassword(), authorities);
  }
}
