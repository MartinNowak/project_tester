// http://stackoverflow.com/a/22004283
import jenkins.model.Jenkins

def instance = Jenkins.getInstance()
instance.setNumExecutors(8)
