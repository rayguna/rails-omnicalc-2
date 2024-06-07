# rails-omnicalc-2

Target: https://omnicalc-2.matchthetarget.com/

RCAV flowchart: https://learn.firstdraft.com/lessons/120-rcav-flowchart

Lesson: https://learn.firstdraft.com/lessons/124

Notes:

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
