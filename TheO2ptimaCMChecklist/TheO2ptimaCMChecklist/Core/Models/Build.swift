
//
//  BuildViewModel.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/30/23.
//


import Foundation
import SwiftData


@Model
class Build {
    var id = UUID()
    @Attribute(.unique)var dateAdded: Date = Date.now
    var isUnitClenedBeforeDiveChecked = false
    var o2BailoutDilFilledChecked = false
    var o2Content = ""
    var bailoutOneDilContent = ""
    var bailoutTwoContent = ""
    var o2SensorsChecked = false
    var isSetPointChanged = false
    var isSetPointTo19 = false
    var cellOneAir: Double
    var cellTwoAir: Double
    var cellThreeAir: Double
    var extVoltage = ""
    var intVoltage = ""
    var isHudFunctioningChecked = false
    var isCanisterHeadLidChecked = false
    var isScrubberStatusChecked = false
    var isScrubberPackedChecked = false
    var eac = ""
    var sorb = ""
    var isNewSorb = false
    var isUsedSorb = false
    var isUsedSorbMin = ""
    var isBorePlugChecked = false
    var isLubedHeadInstalledChecked = false
    var isWaterTrapInstalledChecked = false
    var isO2FlushedChecked = false
    var isControllerCalibratedChecked = false
    var isMvWithO2Checked = false
    var cellOneO2: Double
    var cellTwoO2: Double
    var cellThreeO2: Double
    var isWaterTrapInstalledOnCounterlungsChecked = false
    var isCanisterInstalledOntoCounterLungs = false
    var isUnitPiecesInspectedChecked = false
    var isLoopConnectedTestedDirectionChecked = false
    var isLoopHosesConnectedCounterlungsChecked = false
    var isCablesStowedChecked = false
    var isOxygenSolenoidMAFAttachedChecked = false
    var isCanisterO2attachedToYBlock = false
    var isNegativePressTestChecked = false
    var isPostivePressTestChecked = false
    var isOxygenTurnedOnRecordedChecked = false
    var isLeakDownChecked = false
    var isPrebreatheDoneChecked = false
    var oxygenPressure = ""
    var isGasesComputerConfiguredChecked = false
    var isRegulatorsHosesInstalledTight = false
    
    init(
        id: UUID = UUID(),
        dateAdded: Date = Date.now,
        isUnitClenedBeforeDiveChecked: Bool = false,
        o2BailoutDilFilledChecked: Bool = false,
        o2Content: String = "",
        bailoutOneDilContent: String = "",
        bailoutTwoContent: String = "",
        o2SensorsChecked: Bool = false,
        isSetPointChanged: Bool = false,
        isSetPointTo19: Bool = false,
        cellOneAir: Double = 0.0, 
        cellTwoAir: Double = 0.0,
        cellThreeAir: Double = 0.0,
        extVoltage: String = "",
        intVoltage: String = "",
        isHudFunctioningChecked: Bool = false,
        isCanisterHeadLidChecked: Bool = false,
        isScrubberStatusChecked: Bool = false,
        isScrubberPackedChecked: Bool = false,
        eac: String = "",
        sorb: String = "",
        isNewSorb: Bool = false,
        isUsedSorb: Bool = false,
        isUsedSorbMin: String = "",
        isBorePlugChecked: Bool = false,
        isLubedHeadInstalledChecked: Bool = false,
        isWaterTrapInstalledChecked: Bool = false,
        isO2FlushedChecked: Bool = false,
        isControllerCalibratedChecked: Bool = false,
        isMvWithO2Checked: Bool = false,
        cellOneO2: Double = 0.0,
        cellTwoO2: Double = 0.0,
        cellThreeO2: Double = 0.0,
        isWaterTrapInstalledOnCounterlungsChecked: Bool = false,
        isCanisterInstalledOntoCounterLungs: Bool = false,
        isUnitPiecesInspectedChecked: Bool = false,
        isLoopConnectedTestedDirectionChecked: Bool = false,
        isLoopHosesConnectedCounterlungsChecked: Bool = false,
        isCablesStowedChecked: Bool = false,
        isOxygenSolenoidMAFAttachedChecked: Bool = false,
        isCanisterO2attachedToYBlock: Bool = false,
        isNegativePressTestChecked: Bool = false,
        isPostivePressTestChecked: Bool = false,
        isOxygenTurnedOnRecordedChecked: Bool = false,
        isLeakDownChecked: Bool = false,
        isPrebreatheDoneChecked: Bool = false,
        oxygenPressure: String = "",
        isGasesComputerConfiguredChecked: Bool = false,
        isRegulatorsHosesInstalledTight: Bool = false
    ) {
        self.id = id
        self.dateAdded = dateAdded
        self.isUnitClenedBeforeDiveChecked = isUnitClenedBeforeDiveChecked
        self.o2BailoutDilFilledChecked = o2BailoutDilFilledChecked
        self.o2Content = o2Content
        self.bailoutOneDilContent = bailoutOneDilContent
        self.bailoutTwoContent = bailoutTwoContent
        self.o2SensorsChecked = o2SensorsChecked
        self.isSetPointChanged = isSetPointChanged
        self.isSetPointTo19 = isSetPointTo19
        self.cellOneAir = cellOneAir
        self.cellTwoAir = cellTwoAir
        self.cellThreeAir = cellThreeAir
        self.extVoltage = extVoltage
        self.intVoltage = intVoltage
        self.isHudFunctioningChecked = isHudFunctioningChecked
        self.isCanisterHeadLidChecked = isCanisterHeadLidChecked
        self.isScrubberStatusChecked = isScrubberStatusChecked
        self.isScrubberPackedChecked = isScrubberPackedChecked
        self.eac = eac
        self.sorb = sorb
        self.isNewSorb = isNewSorb
        self.isUsedSorb = isUsedSorb
        self.isUsedSorbMin = isUsedSorbMin
        self.isBorePlugChecked = isBorePlugChecked
        self.isLubedHeadInstalledChecked = isLubedHeadInstalledChecked
        self.isWaterTrapInstalledChecked = isWaterTrapInstalledChecked
        self.isO2FlushedChecked = isO2FlushedChecked
        self.isControllerCalibratedChecked = isControllerCalibratedChecked
        self.isMvWithO2Checked = isMvWithO2Checked
        self.cellOneO2 = cellOneO2
        self.cellTwoO2 = cellTwoO2
        self.cellThreeO2 = cellThreeO2
        self.isWaterTrapInstalledOnCounterlungsChecked = isWaterTrapInstalledOnCounterlungsChecked
        self.isCanisterInstalledOntoCounterLungs = isCanisterInstalledOntoCounterLungs
        self.isUnitPiecesInspectedChecked = isUnitPiecesInspectedChecked
        self.isLoopConnectedTestedDirectionChecked = isLoopConnectedTestedDirectionChecked
        self.isLoopHosesConnectedCounterlungsChecked = isLoopHosesConnectedCounterlungsChecked
        self.isCablesStowedChecked = isCablesStowedChecked
        self.isOxygenSolenoidMAFAttachedChecked = isOxygenSolenoidMAFAttachedChecked
        self.isCanisterO2attachedToYBlock = isCanisterO2attachedToYBlock
        self.isNegativePressTestChecked = isNegativePressTestChecked
        self.isPostivePressTestChecked = isPostivePressTestChecked
        self.isOxygenTurnedOnRecordedChecked = isOxygenTurnedOnRecordedChecked
        self.isLeakDownChecked = isLeakDownChecked
        self.isPrebreatheDoneChecked = isPrebreatheDoneChecked
        self.oxygenPressure = oxygenPressure
        self.isGasesComputerConfiguredChecked = isGasesComputerConfiguredChecked
        self.isRegulatorsHosesInstalledTight = isRegulatorsHosesInstalledTight
    }
    
    // Add a computed property to check if all steps are completed
    var areAllStepsCompleted: Bool {
        return
        // MARK: BuildView2
            isUnitClenedBeforeDiveChecked &&
            o2BailoutDilFilledChecked &&
            !o2Content.isEmpty &&
            !bailoutOneDilContent.isEmpty &&

        // MARK: BuildView3
            o2SensorsChecked &&
            cellOneAir != 0.0 &&
            cellTwoAir != 0.0 &&
            cellThreeAir != 0.0 &&
            isSetPointChanged &&
            !extVoltage.isEmpty &&
            !intVoltage.isEmpty &&

            
        // MARK: BuildView4
            isHudFunctioningChecked &&
            isCanisterHeadLidChecked &&
            isScrubberStatusChecked &&
            !eac.isEmpty &&
            (isNewSorb || isUsedSorb) &&
            isScrubberPackedChecked &&

        
        // MARK: BuildView5
            isBorePlugChecked &&
            isLubedHeadInstalledChecked &&
            isWaterTrapInstalledChecked &&
            isO2FlushedChecked &&
            isControllerCalibratedChecked &&
            isMvWithO2Checked &&
            cellOneO2 != 0.0 &&
            cellTwoO2 != 0.0 &&
            cellThreeO2 != 0.0 &&
            
        // MARK: BuildView6
            isWaterTrapInstalledOnCounterlungsChecked &&
            isCanisterInstalledOntoCounterLungs &&
            isUnitPiecesInspectedChecked &&
            isLoopConnectedTestedDirectionChecked &&
            isLoopHosesConnectedCounterlungsChecked &&
            isCablesStowedChecked &&
        
        // MARK: BuildView7
            isOxygenSolenoidMAFAttachedChecked &&
            isCanisterO2attachedToYBlock &&
            isNegativePressTestChecked &&
            isPostivePressTestChecked &&
        
        // MARK: BuildView8
            isOxygenTurnedOnRecordedChecked &&
            !oxygenPressure.isEmpty &&
            isLeakDownChecked &&
            isPrebreatheDoneChecked &&
        // MARK: BuildView 9
            isGasesComputerConfiguredChecked &&
            isRegulatorsHosesInstalledTight
    }

    // Add a computed property to get incomplete steps
    var incompleteSteps: [Int] {
        var steps: [Int] = []
        
        if !isUnitClenedBeforeDiveChecked {
            steps.append(1)
            print("Step 1 incomplete")
        }
        if !o2BailoutDilFilledChecked {
            steps.append(2)
            print("Step 2 incomplete")
        }
        if o2Content.isEmpty ||
           bailoutOneDilContent.isEmpty ||
           (!bailoutTwoContent.isEmpty && bailoutTwoContent.isEmpty) {
            steps.append(3)
            print("Step 3 incomplete")
        }
        if !o2SensorsChecked {
            steps.append(4)
            print("Step 4 incomplete")
        }
        
        if cellOneAir == 0.0 {
            steps.append(4)
            print("Step 4 incomplete")
        }
        if cellTwoAir == 0.0 {
            steps.append(4)
            print("Step 4 incomplete")
        }
        if cellThreeAir == 0.0 {
            steps.append(4)
            print("Step 4 incomplete")
        }
        if !isSetPointChanged {
            steps.append(5)
            print("Step 5 incomplete")
        }
        if extVoltage.isEmpty {
            steps.append(5)
            print("Step 5 incomplete")
        }
        if intVoltage.isEmpty {
            steps.append(5)
            print("Step 5 incomplete")
        }
        if !isSetPointTo19 {
            steps.append(5)
            print("Step 5 incomplete")
        }
        if !isHudFunctioningChecked {
            steps.append(6)
            print("Step 6 incomplete")
        }
        if !isCanisterHeadLidChecked {
            steps.append(7)
            print("Step 7 incomplete")
        }
        if !isScrubberStatusChecked {
            steps.append(8)
            print("Step 8 incomplete")
        }
        if eac.isEmpty {
            steps.append(8)
            print("Step 8 incomplete")
        }
        if !(isNewSorb || isUsedSorb) {
                steps.append(8)
                print("Step 8 incomplete")
        }
        if !isScrubberPackedChecked {
            steps.append(9)
            print("Step 9 incomplete")
        }
        if !isBorePlugChecked {
            steps.append(10)
            print("Step  incomplete")
        }
        if !isLubedHeadInstalledChecked {
            steps.append(11)
        }
        if !isWaterTrapInstalledChecked {
            steps.append(12)
        }
        if !isO2FlushedChecked {
            steps.append(13)
        }
        if !isControllerCalibratedChecked {
            steps.append(14)
        }
        if !isMvWithO2Checked {
            steps.append(15)
        }
        if cellOneO2 == 0.0 {
            steps.append(15)
        }
        if cellTwoO2 == 0.0 {
            steps.append(15)
        }
        if cellThreeO2 == 0.0 {
            steps.append(15)
        }
        if !isWaterTrapInstalledOnCounterlungsChecked {
            steps.append(16)
        }
        if !isCanisterInstalledOntoCounterLungs {
            steps.append(17)
        }
        if !isUnitPiecesInspectedChecked {
            steps.append(18)
        }
        if !isLoopConnectedTestedDirectionChecked {
            steps.append(19)
        }
        if !isLoopHosesConnectedCounterlungsChecked {
            steps.append(20)
        }
        if !isCablesStowedChecked {
            steps.append(21)
        }
        if !isOxygenSolenoidMAFAttachedChecked {
            steps.append(22)
        }
        if !isCanisterO2attachedToYBlock {
            steps.append(23)
        }
        if !isNegativePressTestChecked {
            steps.append(24)
        }
        if !isPostivePressTestChecked {
            steps.append(25)
        }
        if !isOxygenTurnedOnRecordedChecked {
            steps.append(26)
        }
        if oxygenPressure.isEmpty {
            steps.append(26)
        }
        if !isLeakDownChecked {
            steps.append(27)
        }
        if !isPrebreatheDoneChecked {
            steps.append(28)
        }
        if !isGasesComputerConfiguredChecked {
            steps.append(29)
        }
        if !isRegulatorsHosesInstalledTight {
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





