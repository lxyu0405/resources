## Spring Boot 日志工具logback配置

### Maven Dependency
```python
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-web</artifactId>
</dependency>
<dependency>
	<groupId>org.projectlombok</groupId>
	<artifactId>lombok</artifactId>
</dependency>
```
* Spring Boot default log framework is `logback`, which is contained in `spring-boot-starter-web` already
* Using [lombok](https://projectlombok.org/setup/overview) for its `@Slf4j` annotation
	* Without @Slf4j
	```java
    public class TestLog{
        private final Logger log = LoggerFactory.getLogger(TestLog.class);
        public void testLog(){
            log.info("gogo");
            log.warn("careful");
            log.error("stop");
        }
    }
    ```

    * With @Slf4j
    ```java
    @Slf4j
    public class TestLog{
        public void testLog(){
            log.info("gogo");
            log.warn("careful");
            log.error("stop");
        }
    }
    ```
  
### log config file
* Add `logback-spring.xml` at resources directory, and Spring Boot would automatically load it.
* [Share my logback-spring.xml](https://github.com/lxyu0405/resources/blob/master/logback-spring.xml)

### Useful links
* [Spring Boot 日志配置(超详细)](https://www.jianshu.com/p/f67c721eea1b)