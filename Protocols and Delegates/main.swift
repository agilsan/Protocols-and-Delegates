
protocol AdvanceLifeSupport {
    func performRCP()
}

class EmergencyCallHandler {
    var delegate : AdvanceLifeSupport?
    
    func assessSituation() {
        print("Qué ha pasado?")
    }
    
    func medicalEmergency() {
        delegate?.performRCP()
    }
}

struct Paramedic: AdvanceLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performRCP() {
        print("El paramédico realiza 30 compresiones por segundo")
    }
}

class Doctor: AdvanceLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performRCP() {
        print("El doctor realiza 30 compresiones por segundo")
    }
    
    func useStethescope() {
        print("Escuchando el corazón")
    }
}

class Surgeon: Doctor {
    override func performRCP() {
        super.performRCP()
        print("Canta staging alive de los BeeGees")
    }
    
    func useElectricDrill() {
        print("Whirr....")
    }
}

//let emilio = EmergencyCallHandler()
//let pete = Paramedic(handler: emilio)
//
//emilio.assessSituation()
//emilio.medicalEmergency()

let emilio = EmergencyCallHandler()
let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()
