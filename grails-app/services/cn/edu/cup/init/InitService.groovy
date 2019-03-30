package cn.edu.cup.init

import com.alibaba.fastjson.JSON
import grails.gorm.transactions.Transactional

import javax.servlet.ServletContext

@Transactional
class InitService {

    def grailsApplication
    def dataSource
    def systemMenuService
    def commonService

    /**
     * 初始化代码__开发环境下的初始化代码
     */
    def configureForDevelopment(ServletContext servletContext) {
        println "这是开发环境..."
        println(grailsApplication.metadata.getApplicationName())
        processConfigFile(servletContext)
    }

    /*
    * 从json文件中导入菜单
    * */

    def importFromJsonFile(fileName) {
        def jsonFile = new File(fileName)
        if (jsonFile.exists()) {
            def json = jsonFile.text
            def menus = commonService.importFromJson4Tree(json, SystemMenu.class, "menuItems")
            println("导入：${menus}")
            menus.each { e ->
                systemMenuService.save(e)
            }
        }
    }

    /*
    * 处理ocnfig.json文件
    * */

    private void processConfigFile(ServletContext servletContext) {
        def webRootDir = servletContext.getRealPath("/")
        def configFileName = "${webRootDir}/config/scriptConfig.json"
        def configFile = new File(configFileName)
        def config = [:]
        if (configFile.exists()) {
            config = com.alibaba.fastjson.JSON.parse(configFile.text)
            if (config.scripts) {
                println("脚本文件：" + config.scripts)
                config.scripts.each { e ->
                    loadScripts("${webRootDir}${e}")
                }
            }
        } else {
            config.put("scripts", ["脚本1", "脚本2"])
            def printWriter = new PrintWriter(configFile, "utf-8")
            printWriter.write(JSON.toJSONString(config))
            printWriter.close()
            println("创建配置文件。")
        }
    }

    /**
     * 发布后的初始化代码
     */
    def configureForProduction(ServletContext servletContext) {
        println "这是发布环境..."
        processConfigFile(servletContext)
    }

    /*
    * 加载数据库初始化脚本
    * */

    def loadScripts(String dir) {
        File sf = new File(dir)
        if (sf.exists()) {
            println "load scripts ${dir}"
            if (sf.isDirectory()) {
                sf.eachFile { f ->
                    if (f.isFile()) {
                        executeScript(f)
                    }
                }
            } else {
                println("执行${sf}...")
                executeScript(sf)
            }
        }
    }

    /**
     * 执行附加脚本
     * */

    def executeScript(File sf) {
        //def File sf = new File(fileName)
        println "init - ${sf}"
        if (sf) {
            def db
            def sql = sf.text
            db = new groovy.sql.Sql(dataSource)
            //println "init - ${sql}"
            def lines = sql.split(";")
            lines.each() { it ->
                //println "line: ${it}"
                it = it.trim()
                if (!it.isEmpty()) {
                    db.executeUpdate(it)
                }
            }
        }
    }

}
