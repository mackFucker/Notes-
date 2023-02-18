import ProjectDescription

extension SettingsDictionary {
    func setProjectVersions() -> SettingsDictionary {
        let currentProjectversion = "1.0.0"
        let markettingVersion = "1"
        return appleGenericVersioningSystem().merging([
            "CURRENT_PROJECT_VERSION": SettingValue(stringLiteral: currentProjectversion),
            "MARKETING_VERSION": SettingValue(stringLiteral: markettingVersion)
        ])
    }
}


let target = Target(
    name: "Messendev",
    platform: .iOS,
    product: .app,
    productName: "Messendev",
    bundleId: "airgurt.Messendev",
    deploymentTarget: .iOS(targetVersion: "15.0",
                           devices: .iphone),
    infoPlist: "Info.plist",
    sources: ["Messendev/**"],
    resources: ["Messendev/**"],
    actions: [],
    dependencies: [],
    settings: Settings(
        configurations: [
            .debug(
                name: "Debug"
            )
        ]
    ),
    coreDataModels: [],
    environment: [:],
    launchArguments: []
)

let project = Project(
    name: "Messendev",
    settings: .init(base: SettingsDictionary().setProjectVersions(),
                    configurations: [
                        .debug(
                            name: "Debug"
                        )
                    ],
                    defaultSettings: .recommended),
    targets: [target]
)
