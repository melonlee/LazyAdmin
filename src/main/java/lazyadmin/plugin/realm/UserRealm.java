package lazyadmin.plugin.realm;

import lazyadmin.entity.Admin;
import lazyadmin.service.AdminService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;

/**
 * Created by Melon on 17/2/25.
 */
public class UserRealm extends AuthorizingRealm {

    @Resource
    private AdminService adminService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String) principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setRoles(adminService.findRoles(username));
        authorizationInfo.setStringPermissions(adminService.findPermissions(username));
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        Admin admin = adminService.findByUsername(username);
        if (admin == null) {
            throw new UnknownAccountException();//没找到帐号
        }
        //交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                admin.getUsername(), //用户名
                admin.getPassword(),
                getName()  //realm name
        );
        return authenticationInfo;
    }
}
