from django.contrib import admin

# Register your models here.
from django.contrib.admin.models import LogEntry

from core.entry import LogEntryAdmin

admin.site.register(LogEntry, LogEntryAdmin)
