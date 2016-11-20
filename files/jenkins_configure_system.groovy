import jenkins.model.Jenkins
import hudson.markup.RawHtmlMarkupFormatter

def instance = Jenkins.getInstance()

instance.setSystemMessage("See <a href=\"https://github.com/MartinNowak/project_tester\">https://github.com/MartinNowak/project_tester</a> for the configuration of this Jenkins instance.")

disableSyntaxHighlighting = true
instance.setMarkupFormatter(new RawHtmlMarkupFormatter(!disableSyntaxHighlighting))

instance.save()
