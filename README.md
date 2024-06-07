# rails-omnicalc-2

Target: https://omnicalc-2.matchthetarget.com/

RCAV flowchart: https://learn.firstdraft.com/lessons/120-rcav-flowchart

Lesson: https://learn.firstdraft.com/lessons/124

Notes: This is a good template example for building a rails-based web app to mimic the folder structure.

***
Important folders:

R: ROUTES.RB
- config/routes.rb
- This file contains the url routes (e.g., "/").

C: CONTROLLER RB FILES
- controllers>[addition_controller.rb, division_controller.rb, multiplication_controller.rb, subtraction_controller.rb]
- this is where the children classes of ApplicationController and methods are stored.
- I like how the classes are separated into different files. Nonetheless, it is the class names that matter.
- You may do computation within the class methods and set the variables to @variable_name.
- render the template at the end.

V: VIEWS
- app/views/subfolder/*.html.erb
- this is where the html files are stored.
***

1. Run the app by typing bin/dev in the terminal.

2. Review the error messages to fix the bugs. Trace each of the RCAV files.

3. Bugs: 
- The html.erb form was named incorrectly within the views/addition_templates as addition_form.html.erb instead of add_form.htm.erb.
- The routes don't seem to work properly when each of the links are clicked. Thus, review the config/routes.rb file. I found a typo for the addition form route. It is set as /ad instead of /add.
```
Rails.application.routes.draw do
  get("/add", { :controller => "addition", :action => "show_addition_form" })
end
``` 

- Simultaneously, look at the contents of the app/controllers/ folder. I was able to locate the file called adition_controller.rb which contains the class called AdditionCOntroller. The file name seems to not matter. It is the class name that seems to matter.
```
class AdditionController < ApplicationController
  def show_addition_form
    render({ :template => "addition_templates/add_form" })
  end

  def add_these
    @first_number = params.fetch("first_number").to_f
    @second_number = params.fetch("second_num").to_f

    @result = @first_number + @second_number


    render({ :template => "addition_template/add_results" })
  end
end
```

At this point, the addition page seems to work.

- The submit form for addition should be directed to wizard_add rather than wizard_addition.
```
<h1>New addition</h1>

<form action="/wizard_add">
  <label for="firsttt_field">Add</label>
  <input type="text" id="first_field" name="first_num">

  <label for="second_field">to:</label>
  <input type="text" id="second_field" name="second_num">

  <button>Add!</button>
</form>
```

- The addition_controller does not fetch the parameters correctly.
- The html page textfield ids within views/addition_templates/add_form.html.erb don't match with those within app/controller/addition_controller.rb. Here is the corrected version of the add_form.html.erb.
```
<h1>New addition</h1>

<form action="/wizard_add">
  <label for="first_field">Add</label>
  <input type="text" id="first_number" name="first_num">

  <label for="second_field">to:</label>
  <input type="text" id="second_number" name="second_num">

  <button>Add!</button>
</form>
```
- To figure out the variables names that are being passed around, add the tag <%=params%> within views/addition_templates/add_results.html.erb

- Must also pass the parameters correctly in the views/addition_templates/add_results.html.erb page.
```
<h1>Addition</h1>

<dl>
  <dt>First number</dt>
  <dd><%=@first_number %></dd>

  <dt>Second number</dt>
  <dd><%= @second_number %></dd>

  <%@result=@first_number.to_f + @second_number.to_f%>

  <dt>Result</dt>
  <dd><%= @result %></dd>
</dl>


<a href="/add">Do another addition</a>
```
Troubleshooting Tips: Pay attention to spellings.

- The rest of the bugs were found to be naming inconsistencies in the form objects and in passing parameters in the RCAV elements. 

***
