package com.hl.yyx.config;


import com.hl.yyx.modules.ums.service.UmsAdminService;
import com.hl.yyx.security.SecurityConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
public class MallSecurityConfig extends SecurityConfig {

    @Autowired
    private UmsAdminService umsAdminService;

    /**
     * 将认证交给 springSecurity
     * @return
     */
    @Bean
    public UserDetailsService userDetailsService() {
        return username -> umsAdminService.loadUserByUsername(username);
    }
}
