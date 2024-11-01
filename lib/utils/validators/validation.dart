class TValidator {

  static String? validateEmptyText(String? fieldname, String? value) {
    if (value == null || value.isEmpty) {
      return 'Không để trống!';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email bắt buộc.';
    }

    // Biểu thức chính quy để kiểm tra email
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Địa chỉ email không hợp lệ.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mật khẩu bắt buộc.';
    }

    // Kiểm tra độ dài tối thiểu của mật khẩu
    if (value.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự.';
    }

    // Kiểm tra có chữ in hoa
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Mật khẩu phải chứa ít nhất một chữ in hoa.';
    }

    // Kiểm tra có số
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Mật khẩu phải chứa ít nhất một chữ số.';
    }

    // Kiểm tra có ký tự đặc biệt
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Mật khẩu phải chứa ít nhất một ký tự đặc biệt.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Số điện thoại bắt buộc.';
    }

    // Biểu thức chính quy cho số điện thoại (giả sử là số 10 chữ số tại Mỹ)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Định dạng số điện thoại không hợp lệ (cần 10 chữ số).';
    }

    return null;
  }

// Thêm các bộ kiểm tra tùy chỉnh khác nếu cần cho yêu cầu cụ thể của bạn.
}
