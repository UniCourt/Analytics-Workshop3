
## A shortcut: render()

In Django, there is a common practice of loading a template, populating it with context data, and returning an HttpResponse object with the rendered template. Fortunately, Django provides a convenient shortcut for this. Here is a simplified version of the index() function:

```bash
from django.shortcuts import render

from .models import Question


def index(request):
    latest_question_list = Question.objects.order_by("-pub_date")[:5]
    context = {
    "latest_question_list": latest_question_list
    }
    return render(request, "polls/index.html", context)
```

## Raising a 404 error ( get_object_or_404() )

Now, let’s tackle the question detail view – the page that displays the question text for a given poll. Here’s the view:

let’s update polls/views.py with the below code
```bash
from django.http import Http404
from django.shortcuts import render

from .models import Question


# ...
def detail(request, question_id):
    try:
        question = Question.objects.get(pk=question_id)
    except Question.DoesNotExist:
        raise Http404("Question does not exist")
    return render(request, "polls/detail.html", {"question": question})
```

The view raises the Http404 exception if a question with the requested ID doesn’t exist.

##

Back to the detail() view for our poll application. Given the context variable question, here’s what the polls/detail.html template might look like:

```bash
<h1>{{ question.question_text }}</h1>
<ul>
{% for choice in question.choice_set.all %}
    <li>{{ choice.choice_text }}</li>
{% endfor %}
</ul>
```

The template system uses dot-lookup syntax to access variable attributes. In the example of {{ question.question_text }}, first Django does a dictionary lookup on the object question. Failing that, it tries an attribute lookup – which works, in this case. If attribute lookup had failed, it would’ve tried a list-index lookup.

Method-calling happens in the {% for %} loop: question.choice_set.all is interpreted as the Python code question.choice_set.all(), which returns an iterable of Choice objects and is suitable for use in the {% for %} tag.

## Removing hardcoded URLs in templates

we wrote the link to a question in the polls/index.html template, the link was partially hardcoded like this:

```bash
<li><a href="/polls/{{ question.id }}/">{{ question.question_text }}</a></li>
```

The problem with this hardcoded, tightly-coupled approach is that it becomes challenging to change URLs on projects with a lot of templates.

you can remove a reliance on specific URL paths defined in your url configurations by using the {% url %} template tag:

```bash
<li><a href="{% url 'detail' question.id %}">{{ question.question_text }}</a></li>
```

[`Next`](excersise4.md)