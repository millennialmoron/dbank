import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float"

actor DBank {
  stable var currentValue: Float = 300;
  stable var startTime = Time.now();

  Debug.print(debug_show(startTime));

  let id = "kjdn19384593284752847";

  // Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0){
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print("AHHHHH PANIC!! Something has gone awry...");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    let timeElapsedM = timeElapsedS / 60;
    let timeElapsedH = timeElapsedM / 60;
    currentValue := currentValue * ((1.01)**Float.fromInt(timeElapsedH));
    startTime := Time.now();
  }

  // topUp();
}
