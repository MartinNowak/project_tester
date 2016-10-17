// http://stackoverflow.com/a/22004283
import hudson.model.*

Hudson hudson = Hudson.getInstance()
hudson.setNumExecutors(8)
