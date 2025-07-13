# LazyAdmin 2.0

> 基于Spring Boot的现代化权限管理系统

[![License](https://img.shields.io/badge/license-Apache%202-blue.svg)](LICENSE)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-2.7.18-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![JDK](https://img.shields.io/badge/JDK-17-orange.svg)](https://www.oracle.com/java/technologies/downloads/)
[![Docker](https://img.shields.io/badge/Docker-supported-blue.svg)](https://www.docker.com/)

## 🚀 项目简介

LazyAdmin 2.0 是一个现代化的权限管理系统，基于Spring Boot 2.7.x开发，提供了完整的RBAC权限控制、JWT认证、RESTful API等功能。项目已全面升级，采用最新的技术栈和最佳实践。

## ⭐ 主要特性

### 🔧 技术栈升级
- **Spring Boot 2.7.18** - 现代化的Spring框架
- **JDK 17** - 最新的LTS版本
- **MyBatis Plus 3.5.4** - 强大的ORM框架
- **Spring Security 5.7** - 企业级安全框架
- **JWT** - 无状态认证
- **Redis** - 高性能缓存
- **MySQL 8.0** - 现代化数据库
- **Docker** - 容器化部署

### 🔐 安全特性
- **JWT认证** - 无状态的token认证
- **BCrypt加密** - 安全的密码加密算法
- **RBAC权限控制** - 基于角色的访问控制
- **细粒度权限** - 精确到按钮级别的权限控制
- **安全配置** - CORS、XSS、CSRF防护

### 📊 功能特性
- **用户管理** - 完整的用户生命周期管理
- **角色管理** - 灵活的角色权限分配
- **权限管理** - 树形权限结构管理
- **操作日志** - 完整的操作审计功能
- **在线用户** - 实时用户状态监控

### 🛠️ 开发特性
- **RESTful API** - 标准的REST接口设计
- **Swagger文档** - 自动生成API文档
- **统一响应** - 标准化的响应格式
- **全局异常处理** - 优雅的错误处理
- **参数验证** - 完善的参数校验机制

### 🎯 部署特性
- **Docker支持** - 完整的容器化部署
- **健康检查** - 应用状态监控
- **日志管理** - 结构化日志输出
- **监控指标** - Actuator端点监控
- **负载均衡** - Nginx反向代理

## 🏗️ 技术架构

```
├── 前端层 (RESTful API)
│   ├── 认证授权
│   ├── 参数验证
│   └── 响应格式化
├── 业务层 (Service)
│   ├── 用户管理
│   ├── 角色权限
│   └── 系统日志
├── 持久层 (MyBatis Plus)
│   ├── 数据访问
│   ├── 事务管理
│   └── 数据缓存
└── 基础设施
    ├── Spring Security
    ├── JWT
    ├── Redis
    └── MySQL
```

## 📸 项目截图

### 系统界面展示

* **登录页面**
* ![登录页面](http://wx1.sinaimg.cn/mw690/775c483fly1fd3tx1r137j21h90tdgwu.jpg)

* **登录失败**
* ![登录失败](http://wx1.sinaimg.cn/mw690/775c483fly1fd3twxx6lkj21gi0sz7fj.jpg) 

* **视频管理**
* ![视频管理](http://wx1.sinaimg.cn/mw690/775c483fly1fd3txupe4fj21hb0rfdxj.jpg)

* **账户管理**
* ![账户管理](http://wx4.sinaimg.cn/mw690/775c483fly1fd3tyopqd3j21ha0taqg5.jpg)
* ![账户管理详情](http://wx3.sinaimg.cn/mw690/775c483fly1fd3tyk9nxmj21h80te162.jpg)

* **角色管理**
* ![角色管理](http://wx2.sinaimg.cn/mw690/775c483fly1fd3tx65ii6j21hc0teao9.jpg)

* **权限管理**
* ![权限管理](http://wx1.sinaimg.cn/mw690/775c483fly1fd3txpou02j21hc0tfqju.jpg)
* ![权限管理详情](http://wx4.sinaimg.cn/mw690/775c483fly1fd3txa9v4cj21h70tcalt.jpg)

* **权限错误**
* ![权限错误](http://wx1.sinaimg.cn/mw690/775c483fly1fd3txdwa77j21h90tdalm.jpg)

> **注意**: 以上截图为v1.0版本界面，v2.0版本已全面升级为RESTful API架构，建议使用现代化前端框架（如Vue.js、React等）进行界面开发。

## 🚀 快速开始

### 环境要求

- **JDK 17+**
- **Maven 3.6+**
- **MySQL 8.0+**
- **Redis 6.0+**
- **Docker** (可选)

### 本地开发

1. **克隆项目**
```bash
git clone https://github.com/melonlee/LazyAdmin.git
cd LazyAdmin
```

2. **创建数据库**
```sql
CREATE DATABASE lazy_admin CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

3. **导入数据**
```bash
mysql -u root -p lazy_admin < database/lazy_admin_v2.sql
```

4. **修改配置**
```yaml
# application.yml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/lazy_admin
    username: root
    password: your_password
  redis:
    host: localhost
    port: 6379
```

5. **启动应用**
```bash
./mvnw spring-boot:run
```

6. **访问应用**
- 应用地址: http://localhost:8080/admin
- API文档: http://localhost:8080/admin/swagger-ui.html
- 监控端点: http://localhost:8080/admin/actuator

### Docker部署

1. **构建镜像**
```bash
docker build -t lazy-admin:2.0 .
```

2. **启动服务**
```bash
docker-compose up -d
```

3. **查看状态**
```bash
docker-compose ps
```

## 📊 项目结构

```
LazyAdmin/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/lazy/admin/
│   │   │       ├── config/          # 配置类
│   │   │       ├── controller/      # 控制器
│   │   │       ├── entity/          # 实体类
│   │   │       ├── mapper/          # 数据访问层
│   │   │       ├── service/         # 业务逻辑层
│   │   │       ├── security/        # 安全相关
│   │   │       └── util/            # 工具类
│   │   └── resources/
│   │       ├── application.yml      # 配置文件
│   │       └── mapper/              # MyBatis映射
│   └── test/                        # 测试代码
├── database/                        # 数据库脚本
├── docker-compose.yml               # Docker编排
├── Dockerfile                       # Docker镜像
├── nginx/                           # Nginx配置
└── README.md                        # 项目文档
```

## 🔧 配置说明

### 数据库配置
```yaml
spring:
  datasource:
    type: com.zaxxer.hikari.HikariDataSource
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/lazy_admin
    username: root
    password: password
    hikari:
      maximum-pool-size: 20
      minimum-idle: 5
```

### Redis配置
```yaml
spring:
  redis:
    host: localhost
    port: 6379
    password: 
    database: 0
    lettuce:
      pool:
        max-active: 8
        max-idle: 8
```

### JWT配置
```yaml
security:
  jwt:
    secret: LazyAdminJwtSecretKey2024
    expiration: 604800000  # 7天
    header: Authorization
    prefix: Bearer
```

## 🧪 测试

### 单元测试
```bash
./mvnw test
```

### 集成测试
```bash
./mvnw verify
```

### 测试覆盖率
```bash
./mvnw jacoco:report
```

## 📚 API文档

启动应用后，访问 http://localhost:8080/admin/swagger-ui.html 查看完整的API文档。

### 主要接口

#### 认证接口
- `POST /api/auth/login` - 用户登录
- `POST /api/auth/logout` - 用户登出
- `POST /api/auth/refresh` - 刷新token

#### 用户管理
- `GET /api/users` - 获取用户列表
- `POST /api/users` - 创建用户
- `PUT /api/users/{id}` - 更新用户
- `DELETE /api/users/{id}` - 删除用户

#### 角色管理
- `GET /api/roles` - 获取角色列表
- `POST /api/roles` - 创建角色
- `PUT /api/roles/{id}` - 更新角色
- `DELETE /api/roles/{id}` - 删除角色

#### 权限管理
- `GET /api/permissions` - 获取权限列表
- `POST /api/permissions` - 创建权限
- `PUT /api/permissions/{id}` - 更新权限
- `DELETE /api/permissions/{id}` - 删除权限

## 🔍 监控

### 健康检查
```bash
curl http://localhost:8080/admin/actuator/health
```

### 应用信息
```bash
curl http://localhost:8080/admin/actuator/info
```

### 指标监控
```bash
curl http://localhost:8080/admin/actuator/metrics
```

## 🛠️ 开发指南

### 代码规范
- 使用Google Java代码风格
- 单元测试覆盖率不低于80%
- 所有公共方法必须有JavaDoc注释

### 提交规范
```
feat: 新功能
fix: 错误修复
docs: 文档更新
style: 代码格式化
refactor: 代码重构
test: 测试相关
chore: 构建工具或辅助工具
```

## 📈 性能优化

### 缓存策略
- 用户信息缓存 (30分钟)
- 权限信息缓存 (60分钟)
- 字典数据缓存 (24小时)

### 数据库优化
- 合理的索引设计
- 分页查询优化
- 连接池配置优化

## 🚀 部署指南

### 生产环境部署

1. **环境准备**
```bash
# 安装Docker
curl -fsSL https://get.docker.com | sh

# 安装Docker Compose
curl -L "https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

2. **配置环境变量**
```bash
# 创建.env文件
cat > .env << EOF
MYSQL_ROOT_PASSWORD=your_strong_password
MYSQL_PASSWORD=your_app_password
REDIS_PASSWORD=your_redis_password
JWT_SECRET=your_jwt_secret_key
EOF
```

3. **启动服务**
```bash
docker-compose -f docker-compose.prod.yml up -d
```

### 监控部署
推荐使用Prometheus + Grafana进行监控。

## 📄 更新日志

### v2.0.0 (2024-01-xx)
- 🚀 全面升级到Spring Boot 2.7.x
- 🔧 升级JDK到17版本
- 🔐 替换Shiro为Spring Security
- 💾 升级MyBatis Plus到3.5.x
- 🐳 添加Docker支持
- 📊 集成Swagger API文档
- 🔍 添加Actuator监控
- 🧪 完善单元测试
- 📝 更新项目文档

### v1.0.0 (2017-xx-xx)
- 🎉 项目初始版本
- 基于SSM框架
- 基础的权限管理功能

## 🤝 贡献指南

1. Fork 本项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 创建Pull Request

## 📜 许可证

本项目采用 Apache License 2.0 许可证。详情请查看 [LICENSE](LICENSE) 文件。

## 🙏 致谢

感谢所有贡献者和开源社区的支持！

## 📞 联系方式

- 作者：Melon
- 项目地址：https://github.com/melonlee/LazyAdmin

---

如果这个项目对你有帮助，请给个 ⭐ Star 支持一下！
-------
### 如果它让你有收获，我很开心 :)