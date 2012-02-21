package com.parago.pmo



import org.junit.*
import grails.test.mixin.*

@TestFor(ProjectInfoController)
@Mock(ProjectInfo)
class ProjectInfoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/projectInfo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.projectInfoInstanceList.size() == 0
        assert model.projectInfoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.projectInfoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.projectInfoInstance != null
        assert view == '/projectInfo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/projectInfo/show/1'
        assert controller.flash.message != null
        assert ProjectInfo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/projectInfo/list'


        populateValidParams(params)
        def projectInfo = new ProjectInfo(params)

        assert projectInfo.save() != null

        params.id = projectInfo.id

        def model = controller.show()

        assert model.projectInfoInstance == projectInfo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/projectInfo/list'


        populateValidParams(params)
        def projectInfo = new ProjectInfo(params)

        assert projectInfo.save() != null

        params.id = projectInfo.id

        def model = controller.edit()

        assert model.projectInfoInstance == projectInfo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/projectInfo/list'

        response.reset()


        populateValidParams(params)
        def projectInfo = new ProjectInfo(params)

        assert projectInfo.save() != null

        // test invalid parameters in update
        params.id = projectInfo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/projectInfo/edit"
        assert model.projectInfoInstance != null

        projectInfo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/projectInfo/show/$projectInfo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        projectInfo.clearErrors()

        populateValidParams(params)
        params.id = projectInfo.id
        params.version = -1
        controller.update()

        assert view == "/projectInfo/edit"
        assert model.projectInfoInstance != null
        assert model.projectInfoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/projectInfo/list'

        response.reset()

        populateValidParams(params)
        def projectInfo = new ProjectInfo(params)

        assert projectInfo.save() != null
        assert ProjectInfo.count() == 1

        params.id = projectInfo.id

        controller.delete()

        assert ProjectInfo.count() == 0
        assert ProjectInfo.get(projectInfo.id) == null
        assert response.redirectedUrl == '/projectInfo/list'
    }
}
