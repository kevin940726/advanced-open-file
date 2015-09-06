AdvancedFileView = require '../lib/atom-include-path-view'

describe "AdvancedFileView", ->
  workSpaceElement = null
  beforeEach ->
    workSpaceElement = atom.views.getView(atom.workspace)

    waitsForPromise ->
     atom.packages.activatePackage('keybinding-resolver')

  describe "when the atom-include-path:toggle event is triggered", ->
      it "attaches and detaches the view", ->
          expect(workSpaceElement.querySelector('.advanced-open-file')).not.toExist();

          atom.commands.dispatch workSpaceElement, 'atom-include-path:toggle'
          expect(workSpaceElement.querySelector('.advanced-open-file')).toExist();

          atom.commands.dispatch workSpaceElement, 'atom-include-path:toggle'
          expect(workSpaceElement.querySelector('.advanced-open-file')).not.toExist();

          atom.commands.dispatch workSpaceElement, 'key-binding-resolver:toggle'
          expect(workSpaceElement.querySelector('.key-binding-resolver')).toExist()
