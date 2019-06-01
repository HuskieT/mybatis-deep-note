package org.chris.mybatis.service.impl;

import org.chris.mybatis.entity.Role;
import org.chris.mybatis.mapper.RoleMapper;
import org.chris.mybatis.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RoleServiceImpl implements IRoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public void insert(Role role) {
        roleMapper.insert(role);
    }
}
