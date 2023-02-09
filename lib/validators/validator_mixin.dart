class ValidatorMixin {
  String? emailValidation(value) {
    String emailFormat =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExpEmail = RegExp(emailFormat);
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!regExpEmail.hasMatch(value)) {
      return 'Enter a valid Email';
    }
    return null;
  }

  String? mobileNumberValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Mobile Number is required';
    } else if (value.length != 8) {
      return "Enter a valid mobile number";
    } else if (!value.startsWith('5')) {
      return "Enter a valid mobile number";
    } else if (num.tryParse(value) == null) {
      return "Enter proper number";
    }
    return null;
  }

  String? nidValidation(String value) {
    if (value == null || value.isEmpty) {
      return 'NID is required';
    } else if (value.length < 14 || value.length > 14) {
      return 'Enter a valid NID';
    } else if (value[0].startsWith(RegExp(r'[0-9]'))) {
      return 'Enter a valid NID';
    }
    return null;
  }

  String? requiredValidation(String? value, String message) {
    if (value == null || value.isEmpty) {
      return '$message';
    }
    return null;
  }

  String? contactNumberValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Contact Number is required';
    }
    return null;
  }

  String? ticketNumberValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Ticket Number is required';
    }
    return null;
  }

  String? passwordValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.indexOf(' ') >= 0) {
      return 'Password cannot contain whitespace';
    }
    return null;
  }

  String? subjectValidation(text) {
    if (text == null || text.isEmpty) {
      return 'Subject is required';
    }
    return null;
  }

  String? messageValidation(text) {
    if (text == null || text.isEmpty) {
      return 'Message is required';
    }
    return null;
  }

  String? topicTypeValidation(text) {
    if (text == null || text.isEmpty) {
      return 'Type is required';
    }
    return null;
  }

  String? cabValidation(text) {
    if (text == null || text.isEmpty) {
      return 'CAB is required';
    }
    return null;
  }

  String? passwordMatch(password, confirmPassword) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password != confirmPassword) {
      return 'Password do not match';
    }
    return null;
  }
}
