from django.db import models


class Gist(models.Model):
    owner = models.CharField(max_length=200)
    title = models.CharField(max_length=200)
    content = models.TextField()
    timestamp = models.DateTimeField(auto_now_add=True, editable=False)

    def save(self, *args, **kwargs):
        return super(Gist, self).save(*args, **kwargs)
