// import 'package:flutter/material.dart';
// import 'package:form_validation/form_validation.dart';

// class AlphaNumericValidator extends ValueValidator {
//   AlphaNumericValidator(Map map);

//   static const String type = 'alphanumeric_validator';
  

//   static AlphaNumericValidator fromDynamic(dynamic map) {
//     AlphaNumericValidator({
//     });

//     AlphaNumericValidator result;

//     if (map != null) {
//       assert(map['type'] == type);

//       result = AlphaNumericValidator(
//         // Do additional JSON conversion here
//       )
//     });

//     return result;
//   }

//   Map<String, dynamic> toJson() => {
//     // add additional attributes here
//     "type": type,
//   };

//   @override
//   String? validate({
//     required String label,
//     required String? value,
//   }) {
//     String error = "";
//     if (value?.isNotEmpty == true) {
//       // Do processing to determine if the value is valid or not
//       if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value?? "")) {
//         error = "is invalid";
//       }
//     }

//     return error;
//   }
// }


// void main() {
//   Validator.registerCustomValidatorBuilder(
//     AlphaNumericValidator.type,
//     AlphaNumericValidator.fromDynamic,
//   );

//   // start app
// } 

// ...

// var jsonStr = '''
// {
//   "validators": [{
//     "type": "required"
//   }, {
//     "type": "my_custom_validator"
//   }]
// }
// '''

// // This will create a validation chain with the RequiredValidator as well as the
// // MyCustomValidator defined above
// var validator = Validator.fromDynamic(json.decode(jsonStr));