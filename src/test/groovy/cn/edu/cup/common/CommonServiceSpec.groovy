package cn.edu.cup.common

import cn.edu.cup.chuyun.common.CommonService
import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class CommonServiceSpec extends Specification implements ServiceUnitTest<CommonService>{

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
