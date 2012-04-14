package com.parago.pmo



import org.junit.*
import grails.test.mixin.*

@TestFor(AuditStatusController)
@Mock(AuditStatus)
class AuditStatusControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/auditStatus/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.auditStatusInstanceList.size() == 0
        assert model.auditStatusInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.auditStatusInstance != null
    }

    void testSave() {
        controller.save()

        assert model.auditStatusInstance != null
        assert view == '/auditStatus/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/auditStatus/show/1'
        assert controller.flash.message != null
        assert AuditStatus.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/auditStatus/list'


        populateValidParams(params)
        def auditStatus = new AuditStatus(params)

        assert auditStatus.save() != null

        params.id = auditStatus.id

        def model = controller.show()

        assert model.auditStatusInstance == auditStatus
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/auditStatus/list'


        populateValidParams(params)
        def auditStatus = new AuditStatus(params)

        assert auditStatus.save() != null

        params.id = auditStatus.id

        def model = controller.edit()

        assert model.auditStatusInstance == auditStatus
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/auditStatus/list'

        response.reset()


        populateValidParams(params)
        def auditStatus = new AuditStatus(params)

        assert auditStatus.save() != null

        // test invalid parameters in update
        params.id = auditStatus.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/auditStatus/edit"
        assert model.auditStatusInstance != null

        auditStatus.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/auditStatus/show/$auditStatus.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        auditStatus.clearErrors()

        populateValidParams(params)
        params.id = auditStatus.id
        params.version = -1
        controller.update()

        assert view == "/auditStatus/edit"
        assert model.auditStatusInstance != null
        assert model.auditStatusInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/auditStatus/list'

        response.reset()

        populateValidParams(params)
        def auditStatus = new AuditStatus(params)

        assert auditStatus.save() != null
        assert AuditStatus.count() == 1

        params.id = auditStatus.id

        controller.delete()

        assert AuditStatus.count() == 0
        assert AuditStatus.get(auditStatus.id) == null
        assert response.redirectedUrl == '/auditStatus/list'
    }
}
