package lazyadmin.plugin.realm;

import lazyadmin.entity.Admin;
import lazyadmin.service.AdminService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import javax.annotation.Resource;

/**
 * Created by Melon on 17/2/25.
 */
public class UserRealm extends AuthorizingRealm {

    @Resource
    private AdminService adminService;

    /**
     * 对用户权限进行判定
     *
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String) principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setRoles(adminService.findRoles(username));
        authorizationInfo.setStringPermissions(adminService.findPermissions(username));
        return authorizationInfo;
    }

    /**
     * 对用户基本信息进行判定
     *
     * @param token
     * @return
     * @throws AuthenticationException
     */
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
                ByteSource.Util.bytes(admin.getCredentialsSalt()),
                getName()  //realm name
        );
        return authenticationInfo;
    }
}
