import jenkins.model.Jenkins
import hudson.markup.RawHtmlMarkupFormatter

disableSyntaxHighlighting = true
def instance = Jenkins.getInstance()
instance.setMarkupFormatter(new RawHtmlMarkupFormatter(!disableSyntaxHighlighting))
instance.save()
