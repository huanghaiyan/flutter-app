import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black,
              ),
              child: Stepper(
                currentStep: _currentStep,
                onStepTapped: (int value){
                  setState(() {
                    _currentStep = value;
                  });
                },

                onStepContinue: (){
                  setState(() {
                    _currentStep <2?_currentStep+=1:_currentStep=0;
                  });
                },

                onStepCancel: (){
                  setState(() {
                    _currentStep>0?_currentStep-=1:_currentStep=0;
                  });
                },
                steps: [
                  Step(
                    title: Text("Login"),
                    subtitle: Text("Login first"),
                    content: Text("hahdkdskjfd dsfghjmf"),
                    isActive: _currentStep == 0,
                  ),
                  Step(
                    title: Text("Choose Plan"),
                    subtitle: Text("Choose your plan"),
                    content: Text("Choose your plan,ok?"),
                    isActive: _currentStep == 1,
                  ),
                  Step(
                    title: Text("Confirm payment"),
                    subtitle: Text("Confirm your payment method."),
                    content: Text("Confirm your payment method. adsf"),
                    isActive: _currentStep == 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
