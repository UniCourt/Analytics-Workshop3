## Writing more views

Now let’s add a few more views to polls/views.py. These views are slightly different, because they take an argument:
```commandline
def detail(request, question_id):
    return HttpResponse("You're looking at question %s." % question_id)

def results(request, question_id):
    response = "You're looking at the results of question %s."
    return HttpResponse(response % question_id)

def vote(request, question_id):
    return HttpResponse("You're voting on question %s." % question_id)
```
Wire these new views into the polls.urls module by adding the following path() calls:

```commandline
from django.urls import path

from . import views

urlpatterns = [
    # ex: /polls/
    path('', views.index, name='index'),
    # ex: /polls/5/
    path('<int:question_id>/', views.detail, name='detail'),
    # ex: /polls/5/results/
    path('<int:question_id>/results/', views.results, name='results'),
    # ex: /polls/5/vote/
    path('<int:question_id>/vote/', views.vote, name='vote'),
]
```
http://127.0.0.1:8000/polls/1/

http://127.0.0.1:8000/polls/1/results/

http://127.0.0.1:8000/polls/1/vote

#### Using Django’s template system 

First, create a directory called templates in your polls directory. Django will look for templates in there.

Put the following code in that template:

polls/templates/polls/index.html
```commandline

{% if latest_question_list %}
    <ul>
    {% for question in latest_question_list %}
        <li><a href="/polls/{{ question.id }}/">{{ question.question_text }}</a></li>
    {% endfor %}
    </ul>
{% else %}
    <p>No polls are available.</p>
{% endif %}
```
Now let’s update our index view in polls/views.py to use the template:

```commandline
from django.http import HttpResponse
from django.template import loader

from .models import Question


def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    template = loader.get_template('polls/index.html')
    context = {
        'latest_question_list': latest_question_list,
    }
    return HttpResponse(template.render(context, request))
```
[`Next`](excersise3.md)