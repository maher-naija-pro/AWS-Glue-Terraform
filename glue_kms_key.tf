########################
# glue ecryption key
########################

resource "aws_kms_key" "glue" {
  description             = "kMS key to encrypt glue"
  deletion_window_in_days = 30

  tags = merge(
    {
       "Name" = format(
        "%s-%s-glue-KMS-KEY",
        var.project_name,
        var.platforme_name
      )
      },
)

}

resource "aws_kms_alias" "glue" {
  name          = format(
        "alias/%s_%s_glue_KMS_KEY",
        var.project_name,
        var.platforme_name
      )
  target_key_id = aws_kms_key.glue.key_id
}
