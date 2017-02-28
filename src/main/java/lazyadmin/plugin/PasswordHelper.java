package lazyadmin.plugin;

import lazyadmin.entity.Admin;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Service;

/**
 * 用户密码加密辅助类
 * <p/>
 * Created by Melon on 17/2/28.
 */
@Service
public class PasswordHelper {

    private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();

    private String algorithmName = "md5";
    private int hashIterations = 2;

    public void setRandomNumberGenerator(RandomNumberGenerator randomNumberGenerator) {
        this.randomNumberGenerator = randomNumberGenerator;
    }

    public void setAlgorithmName(String algorithmName) {
        this.algorithmName = algorithmName;
    }

    public void setHashIterations(int hashIterations) {
        this.hashIterations = hashIterations;
    }


    /**
     * 密码加密  md5(name+salt)
     *
     * @param admin
     */
    public void encryptPassword(Admin admin) {

        admin.setSalt(randomNumberGenerator.nextBytes().toHex());
        String newPassword = new SimpleHash(
                algorithmName,
                admin.getPassword(),
                ByteSource.Util.bytes(admin.getCredentialsSalt()),
                hashIterations).toHex();
        admin.setPassword(newPassword);
    }
}
