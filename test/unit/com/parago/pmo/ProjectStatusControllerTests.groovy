package com.parago.pmo



import org.junit.*
import grails.test.mixin.*

@TestFor(ProjectStatusController)
@Mock(ProjectStatus)
class ProjectStatusControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/projectStatus/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.projectStatusInstanceList.size() == 0
        assert model.projectStatusInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.projectStatusInstance != null
    }

    void testSave() {
        controller.save()

        assert model.projectStatusInstance != null
        assert view == '/projectStatus/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/projectStatus/show/1'
        assert controller.flash.message != null
        assert ProjectStatus.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/projectStatus/list'


        populateValidParams(params)
        def projectStatus = new ProjectStatus(params)

        assert projectStatus.save() != null

        params.id = projectStatus.id

        def model = controller.show()

        assert model.projectStatusInstance == projectStatus
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/projectStatus/list'


        populateValidParams(params)
        def projectStatus = new ProjectStatus(params)

        assert projectStatus.save() != null

        params.id = projectStatus.id

        def model = controller.edit()

        assert model.projectStatusInstance == projectStatus
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/projectStatus/list'

        response.reset()


        populateValidParams(params)
        def projectStatus = new ProjectStatus(params)

        assert projectStatus.save() != null

        // test invalid parameters in update
        params.id = projectStatus.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/projectStatus/edit"
        assert model.projectStatusInstance != null

        projectStatus.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/projectStatus/show/$projectStatus.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        projectStatus.clearErrors()

        populateValidParams(params)
        params.id = projectStatus.id
        params.version = -1
        controller.update()

        assert view == "/projectStatus/edit"
        assert model.projectStatusInstance != null
        assert model.projectStatusInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/projectStatus/list'

        response.reset()

        populateValidParams(params)
        def projectStatus = new ProjectStatus(params)

        assert projectStatus.save() != null
        assert ProjectStatus.count() == 1

        params.id = projectStatus.id

        controller.delete()

        assert ProjectStatus.count() == 0
        assert ProjectStatus.get(projectStatus.id) == null
        assert response.redirectedUrl == '/projectStatus/list'
    }
}
