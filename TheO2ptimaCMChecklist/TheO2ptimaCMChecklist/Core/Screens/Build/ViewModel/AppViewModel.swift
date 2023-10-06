import SwiftUI

class AppViewModel: ObservableObject {
    // Build View 2 View Model
    @Published var buildView2ViewModel = BuildView2ViewModel()
    
    // Build View 3 View Model
    @Published var buildView3ViewModel = BuildView3ViewModel()
    
    // Build View 4 View Model
    @Published var buildView4ViewModel = BuildView4ViewModel()
    
    // Build View 5 View Model
    @Published var buildView5ViewModel = BuildView5ViewModel()
    
    // Build View 6 View Model
    @Published var buildView6ViewModel = BuildView6ViewModel()
    
    // Build View 7 View Model
    @Published var buildView7ViewModel = BuildView7ViewModel()
    
    // Build View 8 View Model
    @Published var buildView8ViewModel = BuildView8ViewModel()
    
    // Build View 9 View Model
    @Published var buildView9ViewModel = BuildView9ViewModel()
    
    // Add a computed property to check if all steps are completed
    var areAllStepsCompleted: Bool {
        return
        // MARK: BuildView2
            buildView2ViewModel.isUnitClenedBeforeDiveChecked &&
            buildView2ViewModel.o2BailoutDilFilledChecked &&
            !buildView2ViewModel.o2Content.isEmpty &&
            !buildView2ViewModel.bailoutOneDilContent.isEmpty &&
            !buildView2ViewModel.bailoutTwoContent.isEmpty &&

        // MARK: BuildView3
            buildView3ViewModel.o2SensorsChecked &&
            !buildView3ViewModel.cellOneAir.isEmpty &&
            !buildView3ViewModel.cellTwoAir.isEmpty &&
            !buildView3ViewModel.cellThreeAir.isEmpty &&
            buildView3ViewModel.isSetPointChanged &&
            !buildView3ViewModel.extVoltage.isEmpty &&
            !buildView3ViewModel.intVoltage.isEmpty &&
            buildView3ViewModel.isSetPointTo19 &&
            
        // MARK: BuildView4
            buildView4ViewModel.isHudFunctioningChecked &&
            buildView4ViewModel.isCanisterHeadLidChecked &&
            buildView4ViewModel.isScrubberStatusChecked &&
            !buildView4ViewModel.eac.isEmpty &&
            !buildView4ViewModel.sorb.isEmpty &&
            !buildView4ViewModel.isUsedSorbMin.isEmpty &&
            buildView4ViewModel.isNewSorb &&
            buildView4ViewModel.isUsedSorb &&
            buildView4ViewModel.isScrubberPackedChecked &&
        
        // MARK: BuildView5
            buildView5ViewModel.isBorePlugChecked &&
            buildView5ViewModel.isLubedHeadInstalledChecked &&
            buildView5ViewModel.isWaterTrapInstalledChecked &&
            buildView5ViewModel.isO2FlushedChecked &&
            buildView5ViewModel.isControllerCalibratedChecked &&
            buildView5ViewModel.isMvWithO2Checked &&
            !buildView5ViewModel.cellOneO2.isEmpty &&
            !buildView5ViewModel.cellTwoO2.isEmpty &&
            !buildView5ViewModel.cellThreeO2.isEmpty &&
            
        // MARK: BuildView6
            buildView6ViewModel.isWaterTrapInstalledOnCounterlungsChecked &&
            buildView6ViewModel.isCanisterInstalledOntoCounterLungs &&
            buildView6ViewModel.isUnitPiecesInspectedChecked &&
            buildView6ViewModel.isLoopConnectedTestedDirectionChecked &&
            buildView6ViewModel.isLoopHosesConnectedCounterlungsChecked &&
            buildView6ViewModel.isCablesStowedChecked &&
        
        // MARK: BuildView7
            buildView7ViewModel.isOxygenSolenoidMAFAttachedChecked &&
            buildView7ViewModel.isCanisterO2attachedToYBlock &&
            buildView7ViewModel.isNegativePressTestChecked &&
            buildView7ViewModel.isPostivePressTestChecked &&
        
        // MARK: BuildView8
            buildView8ViewModel.isOxygenTurnedOnRecordedChecked &&
            !buildView8ViewModel.oxygenPressure.isEmpty &&
            buildView8ViewModel.isLeakDownChecked &&
            buildView8ViewModel.isPrebreatheDoneChecked &&
        // MARK: BuildView 9
            buildView9ViewModel.isGasesComputerConfiguredChecked &&
            buildView9ViewModel.isRegulatorsHosesInstalledTight
    }

    // Add a computed property to get incomplete steps
    var incompleteSteps: [Int] {
        var steps: [Int] = []
        if !buildView2ViewModel.isUnitClenedBeforeDiveChecked {
            steps.append(1)
        }
        if !buildView2ViewModel.o2BailoutDilFilledChecked {
            steps.append(2)
        }
        if buildView2ViewModel.o2Content.isEmpty {
            steps.append(3)
        }
        if !buildView2ViewModel.bailoutOneDilContent.isEmpty{
            steps.append(3)
        }
        if buildView2ViewModel.bailoutTwoContent.isEmpty {
            steps.append(3)
        }
        if !buildView3ViewModel.o2SensorsChecked {
            steps.append(4)
        }
        if buildView3ViewModel.cellOneAir.isEmpty {
            steps.append(4)
        }
        if buildView3ViewModel.cellTwoAir.isEmpty {
            steps.append(4)
        }
        if buildView3ViewModel.cellThreeAir.isEmpty {
            steps.append(4)
        }
        if !buildView3ViewModel.isSetPointChanged {
            steps.append(5)
        }
        if buildView3ViewModel.extVoltage.isEmpty {
            steps.append(5)
        }
        if buildView3ViewModel.intVoltage.isEmpty {
            steps.append(5)
        }
        if !buildView3ViewModel.isSetPointTo19 {
            steps.append(5)
        }
        if !buildView4ViewModel.isHudFunctioningChecked {
            steps.append(6)
        }
        if !buildView4ViewModel.isCanisterHeadLidChecked {
            steps.append(7)
        }
        if !buildView4ViewModel.isScrubberStatusChecked {
            steps.append(8)
        }
        if buildView4ViewModel.eac.isEmpty{
            steps.append(8)
        }
        if buildView4ViewModel.sorb.isEmpty {
            steps.append(8)
        }
        if buildView4ViewModel.isUsedSorbMin.isEmpty {
            steps.append(8)
        }
        if !buildView4ViewModel.isNewSorb {
            steps.append(8)
        }
        if !buildView4ViewModel.isUsedSorb {
            steps.append(8)
        }
        if !buildView4ViewModel.isScrubberPackedChecked {
            steps.append(9)
        }
        if !buildView5ViewModel.isBorePlugChecked {
            steps.append(10)
        }
        if !buildView5ViewModel.isLubedHeadInstalledChecked {
            steps.append(11)
        }
        if !buildView5ViewModel.isWaterTrapInstalledChecked {
            steps.append(12)
        }
        if !buildView5ViewModel.isO2FlushedChecked {
            steps.append(13)
        }
        if !buildView5ViewModel.isControllerCalibratedChecked {
            steps.append(14)
        }
        if !buildView5ViewModel.isMvWithO2Checked {
            steps.append(15)
        }
        if buildView5ViewModel.cellOneO2.isEmpty {
            steps.append(15)
        }
        if buildView5ViewModel.cellTwoO2.isEmpty {
            steps.append(15)
        }
        if buildView5ViewModel.cellThreeO2.isEmpty {
            steps.append(15)
        }
        if !buildView6ViewModel.isWaterTrapInstalledOnCounterlungsChecked {
            steps.append(16)
        }
        if !buildView6ViewModel.isCanisterInstalledOntoCounterLungs {
            steps.append(17)
        }
        if !buildView6ViewModel.isUnitPiecesInspectedChecked {
            steps.append(18)
        }
        if !buildView6ViewModel.isLoopConnectedTestedDirectionChecked {
            steps.append(19)
        }
        if !buildView6ViewModel.isLoopHosesConnectedCounterlungsChecked {
            steps.append(20)
        }
        if !buildView6ViewModel.isCablesStowedChecked {
            steps.append(21)
        }
        if !buildView7ViewModel.isOxygenSolenoidMAFAttachedChecked {
            steps.append(22)
        }
        if !buildView7ViewModel.isCanisterO2attachedToYBlock {
            steps.append(23)
        }
        if !buildView7ViewModel.isNegativePressTestChecked {
            steps.append(24)
        }
        if !buildView7ViewModel.isPostivePressTestChecked {
            steps.append(25)
        }
        if !buildView8ViewModel.isOxygenTurnedOnRecordedChecked {
            steps.append(26)
        }
        if buildView8ViewModel.oxygenPressure.isEmpty {
            steps.append(26)
        }
        if !buildView8ViewModel.isLeakDownChecked {
            steps.append(27)
        }
        if !buildView8ViewModel.isPrebreatheDoneChecked {
            steps.append(28)
        }
        if !buildView9ViewModel.isGasesComputerConfiguredChecked {
            steps.append(29)
        }
        if !buildView9ViewModel.isRegulatorsHosesInstalledTight {
            steps.append(30)
        }
        
        return steps
    }
    
    var completedSteps: [Int] {
        var completed: [Int] = []
        for step in 1...30 {
            if !incompleteSteps.contains(step) {
                completed.append(step)
            }
        }
        return completed
    }
}

//MARK: BuildView2 ViewModel
class BuildView2ViewModel: ObservableObject {
    @Published var isUnitClenedBeforeDiveChecked = false
    @Published var o2BailoutDilFilledChecked = false
    
    @Published var o2Content: String = ""
    @Published var bailoutOneDilContent: String = ""
    @Published var bailoutTwoContent: String = ""
    
//    init(o2Content: String = "", bailoutOneDilContent: String = "", bailoutTwoContent: String = "") {
//        self.startingO2 = startingO2
//        self.startingDiluent = startingDiluent
//        self.startingBailout = startingBailout
//    }
}


//MARK: BuildView3 ViewModel
class BuildView3ViewModel: ObservableObject {
    @Published var o2SensorsChecked: Bool = false
    @Published var isSetPointChanged: Bool = false
    @Published var isSetPointTo19: Bool = false
    
    @Published var cellOneAir: String = ""
    @Published var cellTwoAir: String = ""
    @Published var cellThreeAir: String = ""
    
    @Published var extVoltage: String = ""
    @Published var intVoltage: String = ""
}

//MARK: BuildView4 ViewModel
class BuildView4ViewModel: ObservableObject {
    @Published var isHudFunctioningChecked: Bool = false
    @Published var isCanisterHeadLidChecked: Bool = false
    @Published var isScrubberStatusChecked: Bool = false
    @Published var isScrubberPackedChecked: Bool = false
    
    @Published var eac: String = ""
    @Published var sorb: String = ""
    @Published var isNewSorb: Bool = false
    @Published var isUsedSorb: Bool = false
    @Published var isUsedSorbMin: String = ""
    
}

// MARK: BuildView5 ViewModel
class BuildView5ViewModel: ObservableObject {
    @Published var isBorePlugChecked: Bool = false
    @Published var isLubedHeadInstalledChecked: Bool = false
    @Published var isWaterTrapInstalledChecked: Bool = false
    @Published var isO2FlushedChecked: Bool = false
    @Published var isControllerCalibratedChecked: Bool = false
    @Published var isMvWithO2Checked: Bool = false
    // MARK: MillivoltReadingo2Card ViewModel
    @Published var cellOneO2: String = ""
    @Published var cellTwoO2: String = ""
    @Published var cellThreeO2: String = ""
}

// MARK: BuildView6 ViewModel
class BuildView6ViewModel: ObservableObject {
    @Published var isWaterTrapInstalledOnCounterlungsChecked: Bool = false
    @Published var isCanisterInstalledOntoCounterLungs: Bool = false
    @Published var isUnitPiecesInspectedChecked: Bool = false
    @Published var isLoopConnectedTestedDirectionChecked: Bool = false
    @Published var isLoopHosesConnectedCounterlungsChecked: Bool = false
    @Published var isCablesStowedChecked: Bool = false
}

// MARK: BuildView7 ViewModel
class BuildView7ViewModel: ObservableObject {
    @Published var isOxygenSolenoidMAFAttachedChecked: Bool = false
    @Published var isCanisterO2attachedToYBlock: Bool = false
    @Published var isNegativePressTestChecked: Bool = false
    @Published var isPostivePressTestChecked: Bool = false
}

// MARK: BuildView8 ViewModel
class BuildView8ViewModel: ObservableObject {
    @Published var isOxygenTurnedOnRecordedChecked: Bool = false
    @Published var isLeakDownChecked: Bool = false
    @Published var isPrebreatheDoneChecked: Bool = false
    
    // MARK: OxygenPressureCard viewModel
    @Published var oxygenPressure: String = ""
}

// MARK: BuildView9 ViewModel
class BuildView9ViewModel: ObservableObject {
    @Published var isGasesComputerConfiguredChecked: Bool = false
    @Published var isRegulatorsHosesInstalledTight: Bool = false
}
