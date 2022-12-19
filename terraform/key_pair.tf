resource "aws_key_pair" "default" {
  key_name   = "blog"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1Ij493oxfjgCdvwVzLdfcQ8Unmw2D/kO9mkEQ7sK2NpQqYo1jkZU/MkdTiuXGDlKZvwqs03ZyAPKGOwfjQl5DALI1QKMvCgLTzww+pqnS20uGgKEA3L7CV+L8jhRCuFFmiyTl0izBly/8CD20cdb7BbChxwLwOYvy//rFN4Y9WQiKXhdYcASob9oyUPrdoMdSKlzD4DHlPby3BpvKB4G/nuxl7/Ejo4k/+0JTk5+AUu65kJ6PG3NKCUOIT/UHYGK21nzvt7/QPX5gdgAhEEtI8ktsL+z5UEPnVshVur8WlPA0vj6Go9q5uNB99EAzVKF4MSgDOD0eIG8Sud49sRquw6R5OPFb6LmHtPC4T+XMfOPsRxRbNiHpZfcYC8Zu/riUJ4F/4Qi71ifo/JtaYS/QT5FrXfaTzNuh4IRGdTMK3pciJr3kWQSwFNBuFVRiMLH6wRfir10F2iD4gUHuRpVA0k4xGKfBxV4Zc/FxSU/EXKNZGoR37ZsiR2nWfbHTtFI72hQrtzdLl3mhFOOhOINqOCbhKvPjsSLUbvE/4m1UhqegW1IAMq3CnHR9no96uGRvLElv+Xs34fOPfywD6Pri4pc3N8BDLyvPITu/okfcYIy5Dp2LcIXPjNuJYDnRkS92c1RoYlO/BeA2a3YogDYltcL/ysHcWa7CC4SPcrJ24w== pvt0701@gmail.com"


  tags = {
    "Name" = "pvt0701@gmail.com"
  }
}