package com.parago.pmo



import org.junit.*
import grails.test.mixin.*

@TestFor(RiskController)
@Mock(Risk)
class RiskControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/risk/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.riskInstanceList.size() == 0
        assert model.riskInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.riskInstance != null
    }

    void testSave() {
        controller.save()

        assert model.riskInstance != null
        assert view == '/risk/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/risk/show/1'
        assert controller.flash.message != null
        assert Risk.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/risk/list'


        populateValidParams(params)
        def risk = new Risk(params)

        assert risk.save() != null

        params.id = risk.id

        def model = controller.show()

        assert model.riskInstance == risk
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/risk/list'


        populateValidParams(params)
        def risk = new Risk(params)

        assert risk.save() != null

        params.id = risk.id

        def model = controller.edit()

        assert model.riskInstance == risk
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/risk/list'

        response.reset()


        populateValidParams(params)
        def risk = new Risk(params)

        assert risk.save() != null

        // test invalid parameters in update
        params.id = risk.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/risk/edit"
        assert model.riskInstance != null

        risk.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/risk/show/$risk.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        risk.clearErrors()

        populateValidParams(params)
        params.id = risk.id
        params.version = -1
        controller.update()

        assert view == "/risk/edit"
        assert model.riskInstance != null
        assert model.riskInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/risk/list'

        response.reset()

        populateValidParams(params)
        def risk = new Risk(params)

        assert risk.save() != null
        assert Risk.count() == 1

        params.id = risk.id

        controller.delete()

        assert Risk.count() == 0
        assert Risk.get(risk.id) == null
        assert response.redirectedUrl == '/risk/list'
    }
}
