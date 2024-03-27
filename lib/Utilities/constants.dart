class APIConstants{
  static const baseUrl = 'https://gentlebirthmethod.in';

  //////////////// Client /////////////////////////

  static const register = '$baseUrl/home/client_signup/';
  static const login = '$baseUrl/home/client_login/';
  static const add_menstrual_date = '$baseUrl/home/add_date/';
  static const dashboard = '$baseUrl/home/dashboard-details/';
  static const get_video_free = '$baseUrl/home/get_video_free/';
  static const get_video_premium = '$baseUrl/home/get_video/';
  static const plan_list = '$baseUrl/home/plans_list';

  /////////////// Admin ///////////////////

  static const client_list = '$baseUrl/home/clients_list/';

  static const add_free_content = '$baseUrl/home/add_video_free/';
  static const add_price = '$baseUrl/home/add_payment/';
  static const add_week_wise_content = '$baseUrl/home/add_dashboard_data/';
  static const add_premium_content = '$baseUrl/home/add_video/';
  static const add_banners = '$baseUrl/home/add_banner/';
  static const add_workshop_video = '$baseUrl/home/add_workshop_video/';
  static const add_notification = '$baseUrl/home/pushnotification/';

  static const admin_view_free_video = '$baseUrl/home/free_vedio_list/';
  static const admin_view_paid_video = '$baseUrl/home/paid_vedio_list/';
  static const admin_view_week_wise_data = '$baseUrl/home/content_list/';
  static const admin_view_banners = '$baseUrl/home/get_banner/';
  static const admin_view_workshop_video = '$baseUrl/home/get_workshop_video/';

  static const delete_plan_item = '$baseUrl/home/plan_del/';
  static const delete_free_content = '$baseUrl/home/free_vedio_del/';
  static const delete_week_wise_content = '$baseUrl/home/content_del/';
  static const delete_paid_content = '$baseUrl/home/paid_vedio_del/';

  static const edit_plan_item = '$baseUrl/home/plan_edit/';
  static const edit_free_content = '$baseUrl/home/free_vedio_edit/';
  static const edit_week_wise_content = '$baseUrl/home/content_edit/';
  static const edit_paid_content = '$baseUrl/home/paid_vedio_edit/';
  static const edit_workshop_video = '$baseUrl/home/edit_workshop_video/';
  static const edit_banner = '$baseUrl/home/edit_banner/';
}