from import_export.resources import ModelResource

from core.models import *
import logging
logger = logging.getLogger(__name__)


class PostResource(ModelResource):

    class Meta:
        model = Post
        fields = ('name', 'desc',  'image')
        # check for unique fields because we have  no ids in excel file
        import_id_fields = ['name',]
        exclude = ('id',)
        export_order = fields
        skip_unchanged = True


    def before_import_row(self, row, **kwargs):
        """
        Override to add additional logic. Does nothing by default.
        """
        #row['district'] = District.objects.filter(name=row['district'])[0].pk
        pass






