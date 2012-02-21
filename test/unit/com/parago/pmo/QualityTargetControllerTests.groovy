package com.parago.pmo



import org.junit.*
import grails.test.mixin.*

@TestFor(QualityTargetController)
@Mock(QualityTarget)
class QualityTargetControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/qualityTarget/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.qualityTargetInstanceList.size() == 0
        assert model.qualityTargetInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.qualityTargetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.qualityTargetInstance != null
        assert view == '/qualityTarget/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/qualityTarget/show/1'
        assert controller.flash.message != null
        assert QualityTarget.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/qualityTarget/list'


        populateValidParams(params)
        def qualityTarget = new QualityTarget(params)

        assert qualityTarget.save() != null

        params.id = qualityTarget.id

        def model = controller.show()

        assert model.qualityTargetInstance == qualityTarget
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/qualityTarget/list'


        populateValidParams(params)
        def qualityTarget = new QualityTarget(params)

        assert qualityTarget.save() != null

        params.id = qualityTarget.id

        def model = controller.edit()

        assert model.qualityTargetInstance == qualityTarget
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/qualityTarget/list'

        response.reset()


        populateValidParams(params)
        def qualityTarget = new QualityTarget(params)

        assert qualityTarget.save() != null

        // test invalid parameters in update
        params.id = qualityTarget.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/qualityTarget/edit"
        assert model.qualityTargetInstance != null

        qualityTarget.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/qualityTarget/show/$qualityTarget.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        qualityTarget.clearErrors()

        populateValidParams(params)
        params.id = qualityTarget.id
        params.version = -1
        controller.update()

        assert view == "/qualityTarget/edit"
        assert model.qualityTargetInstance != null
        assert model.qualityTargetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/qualityTarget/list'

        response.reset()

        populateValidParams(params)
        def qualityTarget = new QualityTarget(params)

        assert qualityTarget.save() != null
        assert QualityTarget.count() == 1

        params.id = qualityTarget.id

        controller.delete()

        assert QualityTarget.count() == 0
        assert QualityTarget.get(qualityTarget.id) == null
        assert response.redirectedUrl == '/qualityTarget/list'
    }
}
