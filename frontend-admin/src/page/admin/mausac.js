import { useState, useEffect } from 'react'
import ReactPaginate from 'react-paginate';
import {toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { getMethod ,postMethodPayload, deleteMethod} from '../../services/request';
import Swal from 'sweetalert2';


var size = 5
var url = '/api/mau-sac/all?&size='+size+'&sort=id,desc&page=';
const AdminMauSac= ()=>{
    const [items, setItems] = useState([]);
    const [item, setItem] = useState(null);
    const [searchTerm, setSearchTerm] = useState('');
    const [currentPage, setCurrentPage] = useState(0);
    const [pageCount, setPageCount] = useState(0);
    useEffect(()=>{
        getMauSac();
    }, []);

    async function saveData(event) {
        event.preventDefault();
        var user = JSON.parse(localStorage.getItem("user"))
        const payload = {
            maMauSac: event.target.elements.maMauSac.value,
            tenMauSac: event.target.elements.catename.value,
            nguoiTao: user.maNhanVien,
            nguoiCapNhat: user.maNhanVien,
            trangThai: 1,
        };
        console.log(payload);

        if(item != null){
            payload.nguoiTao = item.nguoiTao
        }
        var url = '/api/mau-sac';

        if(item != null){
            url += '/'+item.id
        }
        const res = await postMethodPayload(url, payload)

        if(res.status < 300){
            toast.success('Success!');
            await new Promise(resolve => setTimeout(resolve, 1000));
            window.location.reload();
        }
        if (res.status == 417) {
            var result = await res.json()
            toast.error(result.defaultMessage);
        }
        if(res.status > 300){
            var result = await res.json();
            toast.error(result.message);
        }
    };


    async function getData() {
        const response = await getMethod('/api/mau-sac');
        let result = await response.json();
        if (searchTerm.trim() !== '') {
            result = result.filter(item =>
                item.tenMauSac.toLowerCase().includes(searchTerm.toLowerCase())
            );
        }
        setItems(result);
    }

    const getMauSac = async() =>{
        var response = await getMethod('/api/mau-sac/all?&size='+size+'&sort=id,desc&page='+0)
        var result = await response.json();
        console.log(result);
        setItems(result.content)
        setPageCount(result.totalPages)
        url = '/api/mau-sac/all?&size='+size+'&sort=id,desc&page='
    };

    async function deleteData(id){
        Swal.fire({
            title: "Xác nhận xóa",
            text: "Bạn có chắc chắn muốn xóa mục này không?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Xóa",
            cancelButtonText: "Hủy",
            reverseButtons: true,
        }).then(async (result) => {
            if (result.isConfirmed) {
                const response = await deleteMethod('/api/mau-sac/' + id);
                if (response.status < 300) {
                    toast.success("Xóa thành công!");
                    getData();
                } else if (response.status === 417) {
                    const result = await response.json();
                    toast.warning(result.defaultMessage);
                } else {
                    toast.warning("Xóa thất bại");
                }
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                console.log("Hủy thao tác xóa.");
            }
        });
    }
    function handleShowAllClick() {
        setSearchTerm(''); // Đặt lại từ khóa tìm kiếm
        getData(); // Lấy lại toàn bộ dữ liệu
    }
    function handleSearchClick() {
        if (searchTerm.trim() === '') {
            toast.warning("Vui lòng nhập từ khóa để tìm kiếm."); // Hiển thị thông báo nếu không có từ khóa
        } else {
            getData(searchTerm); // Gọi API với từ khóa tìm kiếm
        }
    }


    function clearInput(){
        setItem(null);
    }
    const handlePageClick = async (data)=>{
        var currentPage = data.selected
        var response = await getMethod(url+currentPage)
        var result = await response.json();
        setItems(result.content)
        setPageCount(result.totalPages)
    }


    return (
        <>
            <div class="headerpageadmin d-flex justify-content-between align-items-center p-3 bg-light border">
                <strong class="text-left"><i className='fa fa-list'></i> Quản lý màu sắc</strong>
                <div className="search-wrapper d-flex align-items-center justify-content-between">
                    <div className="search-container d-flex align-items-center bg-light p-2 rounded shadow-sm">
                        <input
                            type="text"
                            placeholder="Tìm kiếm theo tên"
                            className="form-control border-0 shadow-none"
                            value={searchTerm}
                            onChange={(e) => setSearchTerm(e.target.value)}
                            style={{flex: 1}}
                        />
                        <button className="btn btn-primary ms-2" onClick={handleSearchClick}>
                            <i className="fa fa-search"></i> Tìm kiếm
                        </button>
                        <button className="btn btn-secondary ms-2" onClick={handleShowAllClick}>
                            <i className="fa fa-list"></i> Tất cả
                        </button>
                    </div>
                    <button onClick={() => clearInput()} data-bs-toggle="modal" data-bs-target="#addcate"
                            className="btn btn-success ms-3">
                        <i className='fa fa-plus'></i> Thêm mới
                    </button>
                </div>
            </div>
            <div class="tablediv">
                <div class="headertable">
                    <span class="lbtable">Danh sách thương hiệu</span>
                </div>
                <div class="divcontenttable">
                    <table id="example" class="table table-bordered">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>Mã màu sắc</th>
                            <th>Tên màu sắc</th>
                            <th>Người tạo</th>
                            <th>Người cập nhật</th>
                            <th>Trạng thái</th>
                            <th class="sticky-col">Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        {items.map((item => {
                            return <tr>
                                <td>{item.id}</td>
                                <td>{item.maMauSac}</td>
                                <td>{item.tenMauSac}</td>
                                <td>{item.nguoiTao}</td>
                                <td>{item.nguoiCapNhat}</td>
                                <td
                                    style={{
                                        textAlign: "center",
                                        color: item.trangThai === 0 ? "#6c757d" : "#155724", // Xám đậm hoặc Xanh đậm
                                    }}
                                >
                                    {item.trangThai === 0 ? "Không sử dụng" : "Đang sử dụng"}
                                </td>
                                <td class="sticky-col">
                                    <a onClick={() => setItem(item)} data-bs-toggle="modal" data-bs-target="#addcate"
                                       class="edit-btn"><i className='fa fa-edit'></i></a>
                                    <button onClick={() => deleteData(item.id)} class="delete-btn"><i
                                        className='fa fa-trash'></i></button>
                                </td>
                            </tr>
                        }))}
                        </tbody>
                    </table>
                    <ReactPaginate
                        marginPagesDisplayed={2}
                        pageCount={pageCount}
                        onPageChange={handlePageClick}
                        containerClassName={'pagination'}
                        pageClassName={'page-item'}
                        pageLinkClassName={'page-link'}
                        previousClassName='page-item'
                        previousLinkClassName='page-link'
                        nextClassName='page-item'
                        nextLinkClassName='page-link'
                        breakClassName='page-item'
                        breakLinkClassName='page-link'
                        previousLabel='Trang trước'
                        nextLabel='Trang sau'
                        activeClassName='active'/>
                </div>
            </div>

            <div class="modal fade" id="addcate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="false">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header"><h5 class="modal-title" id="exampleModalLabel">Thêm hoặc cập nhật màu sắc</h5> <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></div>
                <div class="modal-body">
                    <form class="col-sm-5 marginauto" onSubmit={saveData} method='post'>
                        <label>Mã màu sắc</label>
                        <input defaultValue={item?.maMauSac} name="maMauSac" type="text" class="form-control" />
                        <label>Tên</label>
                        <input defaultValue={item?.tenMauSac} name="catename" type="text" class="form-control" />
                        <br/><br/>
                        <button class="btn btn-success form-control action-btn">Xác nhận</button>
                    </form>
                </div>
            </div>
            </div>
        </div>

        </>
    );
}

export default AdminMauSac;