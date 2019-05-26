package org.chris.mybatissqlsessionfactory.service.impl;

import org.chris.mybatissqlsessionfactory.entity.Role;
import org.chris.mybatissqlsessionfactory.mapper.RoleMapper;
import org.chris.mybatissqlsessionfactory.service.IRoleService;
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
