import subprocess , os
import sublime, sublime_plugin

class KeilCompileCommand(sublime_plugin.TextCommand):
	def run(self,edit):
		key = self.view.window().extract_variables()
		os.chdir(key["folder"])							
		path = os.listdir(os.getcwd())
		for x in path:
		    if(x.find(".uvprojx")>0):
        		Project = x
		Command = "C:\\Keil_v5\\UV4\\UV4.exe -b -j0 {0} -o tmplog.txt".format(Project)
		subprocess.call(Command, stdout = subprocess.PIPE, shell = False)
		filea = open("tmplog.txt", "r")
		content = filea.read()
		filea.close()
		win = sublime.active_window()
		pan = win.create_output_panel('my_panel')
		win.run_command('show_panel', {'panel':'output.my_panel'})
		pan.run_command("append", {"characters": content})
		os.remove("tmplog.txt")

'''

class KeilFlashCommand(sublime_plugin.TextCommand):
	def run(self,edit):
		k=self.view.window().extract_variables()
		os.chdir(k["folder"])							
		path=os.listdir(os.getcwd())
						
		for i in path:
		    if(i.find(".uvproj")>0):
        		Project=i

		Command="UV4 -f -j0 {0}".format(Project)
		subprocess.call(Command,stdout=subprocess.PIPE,shell =False )		


class KeilCleanCommand(sublime_plugin.TextCommand):
	def run(self,edit):
		key = self.view.window().extract_variables()
		os.chdir(key["folder"])							
		path = os.listdir(os.getcwd())
		for x in path:
		    if(x.find(".uvproj")>0):
        		Project = x
		Command = "UV4 -c -j0 {0} -o tmplog.txt".format(Project)
		subprocess.call(Command, stdout = subprocess.PIPE, shell = False)
		filea = open("tmplog.txt", "r")
		content = filea.read()
		filea.close()
		win = sublime.active_window()
		pan = win.create_output_panel('my_panel')
		pan.run_command("append", {"characters": content})
		win.run_command('show_panel', {'panel':'output.my_panel'})
		os.remove("tmplog.txt")

'''

