from django.contrib import admin
from .models import Gist

class GistAdmin(admin.ModelAdmin):

    list_display = ['owner', 'timestamp']
    search_fields = ['owner']

    list_filter = ['timestamp']


# Register your models here.
admin.site.register(Gist, GistAdmin)