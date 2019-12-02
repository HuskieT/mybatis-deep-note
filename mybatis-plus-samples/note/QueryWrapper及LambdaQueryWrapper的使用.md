
## QueryWrapper及LambdaQueryWrapper的使用

### QueryWrapper
```
// 查询条件构造器
QueryWrapper<BannerItem> wrapper = new QueryWrapper<>();
wrapper.eq("banner_id", id);
// 查询操作
List<BannerItem> bannerItems = bannerItemMapper.selectList(wrapper);

## 或者

QueryWrapper<BannerItem> wrapper = new QueryWrapper<>();
wrapper.lambda().eq(BannerItem::getBannerId, id);
List<BannerItem> bannerItems = bannerItemMapper.selectList(wrapper);
```
### LambdaQueryWrapper

```
LambdaQueryWrapper<BannerItem> wrapper = new QueryWrapper<BannerItem>().lambda();
wrapper.eq(BannerItem::getBannerId, id);
List<BannerItem> bannerItems = bannerItemMapper.selectList(wrapper);

## 简化后
LambdaQueryWrapper<BannerItem> wrapper = new LambdaQueryWrapper<>();
wrapper.eq(BannerItem::getBannerId, id);
List<BannerItem> bannerItems = bannerItemMapper.selectList(wrapper);

## 链式查询
List<Contract> list = contractMapper.selectList(Wrappers.lambdaQuery(new Contract()).eq(RentalTenantModel::getTenantId,tenantId)
Contract contract = contractMapper.selectList(Wrappers.lambdaQuery(new Contract()).eq(RentalTenantModel::getTenantId,tenantId).one

## 链式查询
List<BannerItem> bannerItems = new LambdaQueryChainWrapper<>(bannerItemMapper)
                        .eq(BannerItem::getBannerId, id)
                        .list();

```


## 参考
[MyBatis-Plus QueryWrapper及LambdaQueryWrapper的使用_简单随风的博客-CSDN博客_lambdaquerywrapper](https://blog.csdn.net/lt326030434/article/details/106571670)