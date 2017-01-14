from django.http import HttpResponse
from django.shortcuts import get_object_or_404, render
from django.views import View

from .models import Gist


# Create your views here.
class GistList(View):
    
    def get(self, request):
        gist_list = Gist.objects.all()
        return render(request, 'gists/index.html', {'gist_list': gist_list})

class GistDetail(View):
    def get(self, request, gist_id):
        gist = get_object_or_404(Gist, pk=gist_id)
        return render(request, 'gists/detail.html', {'gist': gist})
