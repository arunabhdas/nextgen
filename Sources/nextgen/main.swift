// 1 .pbxproj
let pbxproj = PBXProj()

// 2. Create groups
let mainGroup = PBXGroup(sourceTree: .group)
pbxproj.add(object: mainGroup)
let productsGroup = PBXGroup(children: [], sourceTree: .group, name: "Products")
pbxproj.add(object: productsGroup)


// 3. Create configuration list
let configurationList = XCConfigurationList()
pbxproj.add(object: configurationList)
try configurationList.addDefaultConfigurations()

// 4. Create project
let project = PBXProject(name: "MyProject",
buildConfigurationList: configurationList,
compatibilityVersion: Xcode.Default.compatibilityVersion,
mainGroup: mainGroup,
productsGroup: productsGroup)
pbxproj.add(object: project)
pbxproj.rootObject = project

// 5. Create xcodeproj
let workspaceData = XCWorkspaceData(children: [])
let workspace = XCWorkspace(data: workspaceData)
let xcodeproj = XcodeProj(workspace: workspace, pbxproj: pbxproj)

// 6. Save project
let projectPath = Path("/path/to/Project.xcodeproj")
try xcodeproj.write(path: projectPath)

