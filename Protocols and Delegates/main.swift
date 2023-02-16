
protocol AdvanceLifeSUpport {
    func performCPR()
}


class EmergencyCallHandler {
    var delegate: AdvanceLifeSUpport?
    
    func assessSituation() {
        print("Can you tell me what happend?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvanceLifeSUpport {
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does the checst compression, 30 per seconds.")
    }
}


class Doctor: AdvanceLifeSUpport{
    
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does the chest compression, 30 per seconds.")
    }
    
    func useStethescope(){
        print("Listening for heart souncds. ")
    }
    
    
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the jane nhi denge..")
    }
    
    func useElectricDrill() {
        print("Whirr....")
    }
}


let emilio = EmergencyCallHandler()
let pete = Paramedic(handler: emilio)
let bk = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()


