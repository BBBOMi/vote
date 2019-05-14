package net.skhu.config.jwt;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.UnsupportedEncodingException;

/**
 * Created by bomi on 2019-05-14.
 */

@Slf4j
@Component
public class JwtFactory {

    @Value("${JWT.ISSUER}")
    private static String ISSUER;

    @Value("${JWT.SECRET}")
    private static String SECRET;

    public String create() {
        String token = null;
        try {
            token = JWT.create()
                    .withIssuer(ISSUER)
                    //.withClaim()
                    //.withClaim()
                    .sign(Algorithm.HMAC256(SECRET));

        } catch(UnsupportedEncodingException e) {
            log.error(e.getMessage());
        }
    return token;
    }

}